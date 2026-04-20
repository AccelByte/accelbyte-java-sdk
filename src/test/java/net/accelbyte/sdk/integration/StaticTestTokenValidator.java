/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import com.google.common.base.Strings;
import com.google.common.cache.CacheBuilder;
import java.util.List;
import java.util.stream.Collectors;
import net.accelbyte.sdk.api.basic.models.NamespaceContext;
import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.AccessTokenPayload.Types.Permission;
import net.accelbyte.sdk.core.AppInfo;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;

/**
 * Test helper that extends AccelByteSDK with a pre-populated namespace context cache so unit tests
 * can exercise permission matching logic without network calls.
 */
public class StaticTestTokenValidator extends AccelByteSDK {

  private static final int ALL_ACTIONS = 15;

  public StaticTestTokenValidator(String publisherNamespace, String studioNamespace, String gameNamespace) {
    super(
        new AccelByteConfig(
            new OkhttpClient(),
            new DefaultTokenRepository(),
            // [HIGH feedback: use a no-op ConfigRepository that does NOT implement TokenValidation
            // so rolePermissionsCache is never initialized and no outbound HTTP calls are made
            // in this unit-test context]
            new ConfigRepository() {
              @Override public String getClientId() { return ""; }
              @Override public String getClientSecret() { return ""; }
              @Override public String getBaseURL() { return ""; }
              @Override public boolean isAmazonTraceId() { return false; }
              @Override public void activateAmazonTraceId(String version) {}
              @Override public void deactivateAmazonTraceId() {}
              @Override public String getAmazonTraceIdVersion() { return ""; }
              @Override public boolean isClientInfoHeader() { return false; }
              @Override public void activateClientInfoHeader(AppInfo appInfo) {}
              @Override public void deactivateClientInfoHeader() {}
              @Override public AppInfo getAppInfo() { return new AppInfo(); }
            }),
        buildStaticCache(publisherNamespace, studioNamespace, gameNamespace));
  }

  private static com.google.common.cache.Cache<String, NamespaceContext> buildStaticCache(
      String publisherNamespace, String studioNamespace, String gameNamespace) {
    com.google.common.cache.Cache<String, NamespaceContext> cache =
        CacheBuilder.newBuilder().build();

    cache.put(
        publisherNamespace,
        NamespaceContext.builder()
            .namespace(publisherNamespace)
            .type(NamespaceContext.Type.Publisher.toString())
            .build());

    cache.put(
        studioNamespace,
        NamespaceContext.builder()
            .namespace(studioNamespace)
            .type(NamespaceContext.Type.Studio.toString())
            .publisherNamespace(publisherNamespace)
            .build());

    cache.put(
        gameNamespace,
        NamespaceContext.builder()
            .namespace(gameNamespace)
            .type(NamespaceContext.Type.Game.toString())
            .studioNamespace(studioNamespace)
            .publisherNamespace(publisherNamespace)
            .build());

    return cache;
  }

  /**
   * Tests whether any permission in {@code availablePermissions} allows access to
   * {@code targetPermission} when the role is scoped to {@code roleNamespace}.
   *
   * <p>The method trims a trailing {@code -} from {@code roleNamespace} before looking up the
   * namespace context. If no context is found for the trimmed namespace, access is denied.
   * The {@code {namespace}} placeholder in each permission's resource is replaced with
   * {@code roleNamespace} before the check.
   *
   * @param availablePermissions the permissions granted to the role
   * @param roleNamespace        the namespace the role is scoped to (may end with {@code -})
   * @param targetPermission     the resource string to check access for
   * @return {@code true} if any resolved permission grants access to {@code targetPermission}
   */
  public boolean testValidateResource(
      List<Permission> availablePermissions, String roleNamespace, String targetPermission) {
    String trimmed =
        roleNamespace.endsWith("-")
            ? roleNamespace.substring(0, roleNamespace.length() - 1)
            : roleNamespace;

    NamespaceContext ctx = getCachedNamespaceContext(trimmed);
    if (ctx == null) {
      return false;
    }

    List<Permission> resolved =
        availablePermissions.stream()
            .map(
                p -> {
                  String resource = p.getResource();
                  if (!Strings.isNullOrEmpty(resource)) {
                    resource = resource.replace("{namespace}", roleNamespace);
                  }
                  return Permission.builder().resource(resource).action(p.getAction()).build();
                })
            .collect(Collectors.toList());

    return validatePermission(resolved, targetPermission, ALL_ACTIONS);
  }
}
