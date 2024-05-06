/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.campaign;

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
 * queryCodes
 *
 * <p>Query campaign codes. Other detail info:
 *
 * <p>* Returns : list of codes
 */
@Getter
@Setter
public class QueryCodes extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/codes/campaigns/{campaignId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String campaignId;

  private String namespace;
  private Boolean activeOnly;
  private Integer batchNo;
  private String code;
  private Integer limit;
  private Integer offset;

  /**
   * @param campaignId required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryCodes(
      String campaignId,
      String namespace,
      Boolean activeOnly,
      Integer batchNo,
      String code,
      Integer limit,
      Integer offset) {
    this.campaignId = campaignId;
    this.namespace = namespace;
    this.activeOnly = activeOnly;
    this.batchNo = batchNo;
    this.code = code;
    this.limit = limit;
    this.offset = offset;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.campaignId != null) {
      pathParams.put("campaignId", this.campaignId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "activeOnly",
        this.activeOnly == null ? null : Arrays.asList(String.valueOf(this.activeOnly)));
    queryParams.put(
        "batchNo", this.batchNo == null ? null : Arrays.asList(String.valueOf(this.batchNo)));
    queryParams.put("code", this.code == null ? null : Arrays.asList(this.code));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.campaignId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public CodeInfoPagingSlicedResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new CodeInfoPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("activeOnly", "None");
    result.put("batchNo", "None");
    result.put("code", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    return result;
  }
}
