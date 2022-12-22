/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.public_group;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * GetGroupContent
 *
 * <p>Required permission NAMESPACE:{namespace}:USER:{userId}:CONTENT [READ].
 */
@Getter
@Setter
public class GetGroupContent extends Operation {
  /** generated field's value */
  private String path =
      "/ugc/v1/public/namespaces/{namespace}/users/{userId}/groups/{groupId}/contents";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json", "application/octet-stream");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String groupId;

  private String namespace;
  private String userId;
  private Integer limit;
  private Integer offset;

  /**
   * @param groupId required
   * @param namespace required
   * @param userId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetGroupContent(
      String groupId, String namespace, String userId, Integer limit, Integer offset) {
    this.groupId = groupId;
    this.namespace = namespace;
    this.userId = userId;
    this.limit = limit;
    this.offset = offset;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.groupId != null) {
      pathParams.put("groupId", this.groupId);
    }
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
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.groupId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public ModelsPaginatedContentDownloadResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsPaginatedContentDownloadResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("offset", "None");
    return result;
  }
}
