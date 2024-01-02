/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.entitlement;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getPlatformEntitlementConfig
 *
 * <p>Get platform entitlement config list. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:ENTITLEMENT:CONFIG", action=2
 * (READ) * Returns : entitlement info
 */
@Getter
@Setter
public class GetPlatformEntitlementConfig extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/platforms/{platform}/entitlement/config";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String platform;

  /**
   * @param namespace required
   * @param platform required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetPlatformEntitlementConfig(String namespace, String platform) {
    this.namespace = namespace;
    this.platform = platform;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.platform != null) {
      pathParams.put("platform", this.platform);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.platform == null) {
      return false;
    }
    return true;
  }

  public EntitlementPlatformConfigInfo parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new EntitlementPlatformConfigInfo().createFromJson(json);
  }

  public enum Platform {
    Epic("Epic"),
    GooglePlay("GooglePlay"),
    IOS("IOS"),
    Nintendo("Nintendo"),
    Oculus("Oculus"),
    Other("Other"),
    Playstation("Playstation"),
    Steam("Steam"),
    Xbox("Xbox");

    private String value;

    Platform(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class GetPlatformEntitlementConfigBuilder {
    private String platform;

    public GetPlatformEntitlementConfigBuilder platform(final String platform) {
      this.platform = platform;
      return this;
    }

    public GetPlatformEntitlementConfigBuilder platformFromEnum(final Platform platform) {
      this.platform = platform.toString();
      return this;
    }
  }
}
