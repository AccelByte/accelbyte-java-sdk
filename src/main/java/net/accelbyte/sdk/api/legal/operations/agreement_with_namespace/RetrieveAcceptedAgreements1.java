/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.agreement_with_namespace;

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
 * retrieveAcceptedAgreements_1
 *
 * <p>This API will return all accepted Legal Agreements for specified user. Other detail info: *
 * Required permission : resource="ADMIN:NAMESPACE:{namespace}:LEGAL", action=2 (READ)
 */
@Getter
@Setter
public class RetrieveAcceptedAgreements1 extends Operation {
  /** generated field's value */
  private String path =
      "/agreement/admin/namespaces/{namespace}/agreements/policies/users/{userId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private Boolean excludeOtherNamespacesPolicies;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RetrieveAcceptedAgreements1(
      String namespace, String userId, Boolean excludeOtherNamespacesPolicies) {
    this.namespace = namespace;
    this.userId = userId;
    this.excludeOtherNamespacesPolicies = excludeOtherNamespacesPolicies;

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
        "excludeOtherNamespacesPolicies",
        this.excludeOtherNamespacesPolicies == null
            ? null
            : Arrays.asList(String.valueOf(this.excludeOtherNamespacesPolicies)));
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

  public List<RetrieveAcceptedAgreementResponse> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<RetrieveAcceptedAgreementResponse>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("excludeOtherNamespacesPolicies", "None");
    return result;
  }
}
