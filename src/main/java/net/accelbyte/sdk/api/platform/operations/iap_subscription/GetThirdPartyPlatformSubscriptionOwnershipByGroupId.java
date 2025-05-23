/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.iap_subscription;

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
 * getThirdPartyPlatformSubscriptionOwnershipByGroupId
 *
 * <p>Get user third party subscription by subscription group id.
 */
@Getter
@Setter
public class GetThirdPartyPlatformSubscriptionOwnershipByGroupId extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/users/{userId}/iap/subscriptions/platforms/{platform}/ownership/byGroupId";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String platform;
  private String userId;
  private String groupId;

  /**
   * @param namespace required
   * @param platform required
   * @param userId required
   * @param groupId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetThirdPartyPlatformSubscriptionOwnershipByGroupId(
      String namespace, String platform, String userId, String groupId) {
    this.namespace = namespace;
    this.platform = platform;
    this.userId = userId;
    this.groupId = groupId;

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
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("groupId", this.groupId == null ? null : Arrays.asList(this.groupId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.platform == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    if (this.groupId == null) {
      return false;
    }
    return true;
  }

  public ThirdPartySubscriptionOwnership parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ThirdPartySubscriptionOwnership().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("groupId", "None");
    return result;
  }

  public enum Platform {
    APPLE("APPLE"),
    EPICGAMES("EPICGAMES"),
    GOOGLE("GOOGLE"),
    OCULUS("OCULUS"),
    PLAYSTATION("PLAYSTATION"),
    STADIA("STADIA"),
    STEAM("STEAM"),
    TWITCH("TWITCH"),
    XBOX("XBOX");

    private String value;

    Platform(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class GetThirdPartyPlatformSubscriptionOwnershipByGroupIdBuilder {
    private String platform;

    public GetThirdPartyPlatformSubscriptionOwnershipByGroupIdBuilder platform(
        final String platform) {
      this.platform = platform;
      return this;
    }

    public GetThirdPartyPlatformSubscriptionOwnershipByGroupIdBuilder platformFromEnum(
        final Platform platform) {
      this.platform = platform.toString();
      return this;
    }
  }
}
