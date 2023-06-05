/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.agreement_with_namespace;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * retrieveAllUsersByPolicyVersion_1
 *
 * <p>This API will return all users who has accepted a specific policy version.Other detail info: *
 * Required permission : resource="ADMIN:NAMESPACE:{namespace}:LEGAL", action=2 (READ)
 */
@Getter
@Setter
public class RetrieveAllUsersByPolicyVersion1 extends Operation {
  /** generated field's value */
  private String path = "/agreement/admin/namespaces/{namespace}/agreements/policy-versions/users";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Boolean convertGameUserId;
  private String keyword;
  private Integer limit;
  private Integer offset;
  private String policyVersionId;

  /**
   * @param namespace required
   * @param policyVersionId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RetrieveAllUsersByPolicyVersion1(
      String namespace,
      Boolean convertGameUserId,
      String keyword,
      Integer limit,
      Integer offset,
      String policyVersionId) {
    this.namespace = namespace;
    this.convertGameUserId = convertGameUserId;
    this.keyword = keyword;
    this.limit = limit;
    this.offset = offset;
    this.policyVersionId = policyVersionId;

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
        "convertGameUserId",
        this.convertGameUserId == null
            ? null
            : Arrays.asList(String.valueOf(this.convertGameUserId)));
    queryParams.put("keyword", this.keyword == null ? null : Arrays.asList(this.keyword));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put(
        "policyVersionId",
        this.policyVersionId == null ? null : Arrays.asList(this.policyVersionId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.policyVersionId == null) {
      return false;
    }
    return true;
  }

  public PagedRetrieveUserAcceptedAgreementResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PagedRetrieveUserAcceptedAgreementResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("convertGameUserId", "None");
    result.put("keyword", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("policyVersionId", "None");
    return result;
  }
}
