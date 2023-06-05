/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.policies;

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
 * retrieveLatestPoliciesByNamespaceAndCountryPublic
 *
 * <p>Retrieve all active latest policies based on a namespace and country. Other detail info:
 *
 * <p>* Leave the policyType empty if you want to be responded with all policy type * Fill the tags
 * if you want to filter the responded policy by tags * Fill the defaultOnEmpty with true if you
 * want to be responded with default country-specific policy if your requested country is not exist
 * * Fill the alwaysIncludeDefault with true if you want to be responded with always include default
 * policy. If there are duplicate policies (default policies and country specific policies with same
 * base policy) it'll include policy with same country code, for example: * Document 1 (default):
 * Region US (default), UA * Document 2 (default): Region US (default) * Document 3 (default):
 * Region US (default) * User: Region UA * Query: alwaysIncludeDefault: true * Response: Document 1
 * (UA), Document 2 (US), Document 3 (US)
 */
@Getter
@Setter
public class RetrieveLatestPoliciesByNamespaceAndCountryPublic extends Operation {
  /** generated field's value */
  private String path = "/agreement/public/policies/namespaces/{namespace}/countries/{countryCode}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String countryCode;

  private String namespace;
  private Boolean alwaysIncludeDefault;
  private Boolean defaultOnEmpty;
  private String policyType;
  private String tags;

  /**
   * @param countryCode required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RetrieveLatestPoliciesByNamespaceAndCountryPublic(
      String countryCode,
      String namespace,
      Boolean alwaysIncludeDefault,
      Boolean defaultOnEmpty,
      String policyType,
      String tags) {
    this.countryCode = countryCode;
    this.namespace = namespace;
    this.alwaysIncludeDefault = alwaysIncludeDefault;
    this.defaultOnEmpty = defaultOnEmpty;
    this.policyType = policyType;
    this.tags = tags;
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
    queryParams.put(
        "alwaysIncludeDefault",
        this.alwaysIncludeDefault == null
            ? null
            : Arrays.asList(String.valueOf(this.alwaysIncludeDefault)));
    queryParams.put(
        "defaultOnEmpty",
        this.defaultOnEmpty == null ? null : Arrays.asList(String.valueOf(this.defaultOnEmpty)));
    queryParams.put("policyType", this.policyType == null ? null : Arrays.asList(this.policyType));
    queryParams.put("tags", this.tags == null ? null : Arrays.asList(this.tags));
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
    return true;
  }

  public List<RetrievePolicyPublicResponse> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<RetrievePolicyPublicResponse>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("alwaysIncludeDefault", "None");
    result.put("defaultOnEmpty", "None");
    result.put("policyType", "None");
    result.put("tags", "None");
    return result;
  }

  public enum PolicyType {
    LEGALDOCUMENTTYPE("LEGAL_DOCUMENT_TYPE"),
    MARKETINGPREFERENCETYPE("MARKETING_PREFERENCE_TYPE");

    private String value;

    PolicyType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class RetrieveLatestPoliciesByNamespaceAndCountryPublicBuilder {
    private String policyType;

    public RetrieveLatestPoliciesByNamespaceAndCountryPublicBuilder policyType(
        final String policyType) {
      this.policyType = policyType;
      return this;
    }

    public RetrieveLatestPoliciesByNamespaceAndCountryPublicBuilder policyTypeFromEnum(
        final PolicyType policyType) {
      this.policyType = policyType.toString();
      return this;
    }
  }
}
