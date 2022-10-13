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
import net.accelbyte.sdk.api.legal.operations.base_legal_policies.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class BaseLegalPolicies {

  private AccelByteSDK sdk;

  public BaseLegalPolicies(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see RetrieveAllLegalPolicies
   */
  public List<RetrieveBasePolicyResponse> retrieveAllLegalPolicies(RetrieveAllLegalPolicies input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreatePolicy
   */
  public CreateBasePolicyResponse createPolicy(CreatePolicy input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveSinglePolicy
   */
  public RetrieveBasePolicyResponse retrieveSinglePolicy(RetrieveSinglePolicy input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PartialUpdatePolicy
   */
  public UpdateBasePolicyResponse partialUpdatePolicy(PartialUpdatePolicy input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrievePolicyCountry
   */
  public RetrievePolicyResponse retrievePolicyCountry(RetrievePolicyCountry input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveAllPolicyTypes
   */
  public List<RetrievePolicyTypeResponse> retrieveAllPolicyTypes(RetrieveAllPolicyTypes input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
