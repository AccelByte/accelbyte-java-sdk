/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.dlc;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * getUserDLC
 *
 * <p>Get user dlc records. Note: includeAllNamespaces means this endpoint will return user dlcs
 * from all namespace, example scenario isadmin may need to check the user dlcs before unlink a 3rd
 * party account, so the user dlcs should be from all namespaces because unlinking is a platform
 * level action Other detail info:
 *
 * <p>* Returns : user dlc
 */
@Getter
@Setter
public class GetUserDLC extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/users/{userId}/dlc/records";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private Boolean includeAllNamespaces;
  private String status;
  private String type;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetUserDLC(
      String namespace, String userId, Boolean includeAllNamespaces, String status, String type) {
    this.namespace = namespace;
    this.userId = userId;
    this.includeAllNamespaces = includeAllNamespaces;
    this.status = status;
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
    queryParams.put(
        "includeAllNamespaces",
        this.includeAllNamespaces == null
            ? null
            : Arrays.asList(String.valueOf(this.includeAllNamespaces)));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
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
    return true;
  }

  public List<UserDLCRecord> parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper().readValue(json, new TypeReference<List<UserDLCRecord>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("includeAllNamespaces", "None");
    result.put("status", "None");
    result.put("type", "None");
    return result;
  }

  public enum Status {
    FULFILLED("FULFILLED"),
    REVOKED("REVOKED"),
    REVOKEFAILED("REVOKE_FAILED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Type {
    EPICGAMES("EPICGAMES"),
    OCULUS("OCULUS"),
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

  public static class GetUserDLCBuilder {
    private String status;
    private String type;

    public GetUserDLCBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public GetUserDLCBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public GetUserDLCBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public GetUserDLCBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}
