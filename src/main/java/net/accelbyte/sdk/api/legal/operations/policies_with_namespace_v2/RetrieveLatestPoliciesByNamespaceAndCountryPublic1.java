/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.policies_with_namespace_v2;

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
 * retrieveLatestPoliciesByNamespaceAndCountryPublic_1
 *
 * <p>This API is used to list all the related doc in register page, include optional & mandatory
 * (when env config APP_LEGAL_AGREEMENT_ALWAYS_INCLUDE_DEFAULT=true). Other detail info: Here are
 * the result of different cases * Document 1, Region US (default, mandatory), UA (optional);
 * clientID: [client_A] * Document 2, Region US (default, optional), UA (mandatory); clientID:
 * [client_A] * Document 3, Region UA (default, mandatory); clientID: [client_A] * Document 4,
 * Region US (default, optional); clientID: [client_A] * Document 5, Region US (default, optional);
 * clientID: [client_B] * Document 6, Region CA (mandatory, optional), UA (optional); clientID:
 * [client_B] * Query by: Region UA + client_A * Response: Document 1 (UA, optional), Document 2
 * (UA, mandatory), Document 3 (UA, mandatory), Document 4 (US, optional) * Query by: Region CA +
 * client_A * Response: Document 1 (US, mandatory), Document 2 (US, mandatory), Document 3 (UA,
 * mandatory), Document 4 (US, optional) * Query by: Region UA + client_B * Response: Document 5
 * (US, optional), Document 6 (UA, optional) * Query by: Region CN + client_B * Response: Document 5
 * (US, optional), Document 6 (CA, mandatory) Note: If
 * APP_LEGAL_AGREEMENT_ALWAYS_INCLUDE_DEFAULT=false the behavior will be same with
 * `/agreement/public/policies/namespaces/{namespace}/countries/{country_code}?defaultOnEmpty=true&visibleOnly;=true`;Here
 * are the result of different cases * Query by: Region UA + client_A * Response: Document 1 (UA,
 * optional), Document 2 (UA, mandatory), Document 3 (UA, mandatory) * Query by: Region UA +
 * client_B * Response: Document 5 (US, optional)
 */
@Getter
@Setter
public class RetrieveLatestPoliciesByNamespaceAndCountryPublic1 extends Operation {
  /** generated field's value */
  private String path =
      "/agreement/v2/public/policies/namespaces/{namespace}/countries/{countryCode}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String countryCode;

  private String namespace;
  private String clientId;

  /**
   * @param countryCode required
   * @param namespace required
   * @param clientId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RetrieveLatestPoliciesByNamespaceAndCountryPublic1(
      String countryCode, String namespace, String clientId) {
    this.countryCode = countryCode;
    this.namespace = namespace;
    this.clientId = clientId;
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.countryCode != null) {
      pathParams.put("countryCode", this.countryCode);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("clientId", this.clientId == null ? null : Arrays.asList(this.clientId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.countryCode == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.clientId == null) {
      return false;
    }
    return true;
  }

  public List<RetrieveSimplePolicyPublicResponseV2> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<RetrieveSimplePolicyPublicResponseV2>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("clientId", "None");
    return result;
  }
}
