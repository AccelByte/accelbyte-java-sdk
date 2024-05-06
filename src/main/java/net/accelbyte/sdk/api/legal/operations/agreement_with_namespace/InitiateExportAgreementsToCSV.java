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
 * initiateExportAgreementsToCSV
 *
 * <p>This API will initiate a worker to export list of users who has accepted a specific policy
 * version into a CSV file. To check the export state after initialize it, use `GET
 * /admin/namespaces/{namespace}/agreements/policy-versions/users/export-csv/download` API.
 *
 * <p>This Initiate API is not allow multiple export worker running for the same namespace, it will
 * return 409 http error if so.
 */
@Getter
@Setter
public class InitiateExportAgreementsToCSV extends Operation {
  /** generated field's value */
  private String path =
      "/agreement/admin/namespaces/{namespace}/agreements/policy-versions/users/export-csv/initiate";

  private String method = "POST";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String end;
  private String policyVersionId;
  private String start;

  /**
   * @param namespace required
   * @param policyVersionId required
   * @param start required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public InitiateExportAgreementsToCSV(
      String namespace, String end, String policyVersionId, String start) {
    this.namespace = namespace;
    this.end = end;
    this.policyVersionId = policyVersionId;
    this.start = start;

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
    queryParams.put("end", this.end == null ? null : Arrays.asList(this.end));
    queryParams.put(
        "policyVersionId",
        this.policyVersionId == null ? null : Arrays.asList(this.policyVersionId));
    queryParams.put("start", this.start == null ? null : Arrays.asList(this.start));
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
    if (this.start == null) {
      return false;
    }
    return true;
  }

  public InitiateExportAgreementsToCSVResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new InitiateExportAgreementsToCSVResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("end", "None");
    result.put("policyVersionId", "None");
    result.put("start", "None");
    return result;
  }
}
