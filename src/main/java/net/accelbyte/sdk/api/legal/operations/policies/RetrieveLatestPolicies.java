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
 * retrieveLatestPolicies
 *
 * <p>Retrieve all active latest policies based on a country. Other detail info:
 *
 * <p>* Leave the policyType empty if you want to be responded with all policy type * Fill the tags
 * if you want to filter the responded policy by tags * Fill the defaultOnEmpty with true if you
 * want to be responded with default country-specific policy if your requested country is not exist
 */
@Getter
@Setter
public class RetrieveLatestPolicies extends Operation {
  /** generated field's value */
  private String path = "/agreement/public/policies/countries/{countryCode}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String countryCode;

  private Boolean defaultOnEmpty;
  private String policyType;
  private String tags;

  /**
   * @param countryCode required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RetrieveLatestPolicies(
      String countryCode, Boolean defaultOnEmpty, String policyType, String tags) {
    this.countryCode = countryCode;
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
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
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

  public static class RetrieveLatestPoliciesBuilder {
    private String policyType;

    public RetrieveLatestPoliciesBuilder policyType(final String policyType) {
      this.policyType = policyType;
      return this;
    }

    public RetrieveLatestPoliciesBuilder policyTypeFromEnum(final PolicyType policyType) {
      this.policyType = policyType.toString();
      return this;
    }
  }
}
