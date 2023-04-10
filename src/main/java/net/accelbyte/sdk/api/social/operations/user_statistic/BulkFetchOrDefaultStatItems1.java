/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.user_statistic;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * bulkFetchOrDefaultStatItems_1
 *
 * <p>Bulk fetch multiple user's stat item values for a given namespace and statCode. NOTE: If stat
 * item does not exist, will return default value. Other detail info: + *Required permission*:
 * resource=ADMIN:NAMESPACE:{namespace}:STATITEM, action=2 (READ) + *Returns*: list of user's stat
 * item values
 */
@Getter
@Setter
public class BulkFetchOrDefaultStatItems1 extends Operation {
  /** generated field's value */
  private String path = "/social/v2/admin/namespaces/{namespace}/statitems/value/bulk/getOrDefault";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String additionalKey;
  private String statCode;
  private List<String> userIds;

  /**
   * @param namespace required
   * @param statCode required
   * @param userIds required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public BulkFetchOrDefaultStatItems1(
      String namespace, String additionalKey, String statCode, List<String> userIds) {
    this.namespace = namespace;
    this.additionalKey = additionalKey;
    this.statCode = statCode;
    this.userIds = userIds;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "additionalKey", this.additionalKey == null ? null : Arrays.asList(this.additionalKey));
    queryParams.put("statCode", this.statCode == null ? null : Arrays.asList(this.statCode));
    queryParams.put("userIds", this.userIds == null ? null : this.userIds);
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.statCode == null) {
      return false;
    }
    if (this.userIds == null) {
      return false;
    }
    return true;
  }

  public List<ADTOObjectForUserStatItemValue> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ADTOObjectForUserStatItemValue>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("additionalKey", "None");
    result.put("statCode", "None");
    result.put("userIds", "multi");
    return result;
  }
}
