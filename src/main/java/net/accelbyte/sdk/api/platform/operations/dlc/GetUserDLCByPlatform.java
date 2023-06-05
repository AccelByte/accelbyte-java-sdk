/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.dlc;

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
 * getUserDLCByPlatform
 *
 * <p>Get user dlc by platform. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:IAP", action=2
 * (READ) * Returns : user dlc
 */
@Getter
@Setter
public class GetUserDLCByPlatform extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/users/{userId}/dlc";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private String type;

  /**
   * @param namespace required
   * @param userId required
   * @param type required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetUserDLCByPlatform(String namespace, String userId, String type) {
    this.namespace = namespace;
    this.userId = userId;
    this.type = type;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("type", this.type == null ? null : Arrays.asList(this.type));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    if (this.type == null) {
      return false;
    }
    return true;
  }

  public UserDLC parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new UserDLC().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("type", "None");
    return result;
  }

  public enum Type {
    EPICGAMES("EPICGAMES"),
    PSN("PSN"),
    STEAM("STEAM"),
    XBOX("XBOX");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class GetUserDLCByPlatformBuilder {
    private String type;

    public GetUserDLCByPlatformBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public GetUserDLCByPlatformBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}
