/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operations.policies.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Policies {

  private AccelByteSDK sdk;

  public Policies(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see RetrievePolicies
   */
  public List<RetrievePolicyResponse> retrievePolicies(RetrievePolicies input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldUpdatePolicy
   */
  public void oldUpdatePolicy(OldUpdatePolicy input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldSetDefaultPolicy
   */
  public void oldSetDefaultPolicy(OldSetDefaultPolicy input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveCountryListWithPolicies
   */
  public List<String> retrieveCountryListWithPolicies(RetrieveCountryListWithPolicies input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveLatestPolicies
   */
  public List<RetrievePolicyPublicResponse> retrieveLatestPolicies(RetrieveLatestPolicies input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveLatestPoliciesPublic
   */
  public List<RetrievePolicyPublicResponse> retrieveLatestPoliciesPublic(
      RetrieveLatestPoliciesPublic input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldRetrieveLatestPoliciesByNamespaceAndCountryPublic
   */
  public List<RetrievePolicyPublicResponse> oldRetrieveLatestPoliciesByNamespaceAndCountryPublic(
      OldRetrieveLatestPoliciesByNamespaceAndCountryPublic input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
