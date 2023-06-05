/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.policy_versions;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * retrieveSinglePolicyVersion
 *
 * <p>Retrieve a version of a particular country specific policy. If version is not provided, the
 * Legal Service will assume caller requesting all versions from country-specific policy. Other
 * detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=2 (READ)
 */
@Getter
@Setter
public class RetrieveSinglePolicyVersion extends Operation {
  /** generated field's value */
  private String path = "/agreement/admin/policies/{policyId}/versions";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String policyId;

  private String versionId;

  /**
   * @param policyId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RetrieveSinglePolicyVersion(String policyId, String versionId) {
    this.policyId = policyId;
    this.versionId = versionId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.policyId != null) {
      pathParams.put("policyId", this.policyId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("versionId", this.versionId == null ? null : Arrays.asList(this.versionId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.policyId == null) {
      return false;
    }
    return true;
  }

  public List<RetrievePolicyVersionResponse> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<RetrievePolicyVersionResponse>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("versionId", "None");
    return result;
  }
}
