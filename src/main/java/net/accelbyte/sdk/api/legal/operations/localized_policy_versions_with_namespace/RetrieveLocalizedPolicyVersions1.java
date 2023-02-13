/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace;

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
 * retrieveLocalizedPolicyVersions_1
 *
 * <p>Retrieve versions of a particular country-specific policy. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:LEGAL", action=2 (READ)
 */
@Getter
@Setter
public class RetrieveLocalizedPolicyVersions1 extends Operation {
  /** generated field's value */
  private String path =
      "/agreement/admin/namespaces/{namespace}/localized-policy-versions/versions/{policyVersionId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String policyVersionId;

  /**
   * @param namespace required
   * @param policyVersionId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RetrieveLocalizedPolicyVersions1(String namespace, String policyVersionId) {
    this.namespace = namespace;
    this.policyVersionId = policyVersionId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.policyVersionId != null) {
      pathParams.put("policyVersionId", this.policyVersionId);
    }
    return pathParams;
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

  public List<RetrieveLocalizedPolicyVersionResponse> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<RetrieveLocalizedPolicyVersionResponse>>() {});
  }
}
