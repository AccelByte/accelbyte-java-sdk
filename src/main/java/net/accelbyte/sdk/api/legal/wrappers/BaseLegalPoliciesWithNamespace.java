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
import net.accelbyte.sdk.api.legal.operations.base_legal_policies_with_namespace.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class BaseLegalPoliciesWithNamespace {

  private AccelByteSDK sdk;

  public BaseLegalPoliciesWithNamespace(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see RetrieveAllLegalPoliciesByNamespace
   */
  public List<RetrieveBasePolicyResponse> retrieveAllLegalPoliciesByNamespace(
      RetrieveAllLegalPoliciesByNamespace input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreatePolicy1
   */
  public CreateBasePolicyResponse createPolicy1(CreatePolicy1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveSinglePolicy1
   */
  public RetrieveBasePolicyResponse retrieveSinglePolicy1(RetrieveSinglePolicy1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PartialUpdatePolicy1
   */
  public UpdateBasePolicyResponse partialUpdatePolicy1(PartialUpdatePolicy1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrievePolicyCountry1
   */
  public RetrievePolicyResponse retrievePolicyCountry1(RetrievePolicyCountry1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveAllPolicyTypes1
   */
  public List<RetrievePolicyTypeResponse> retrieveAllPolicyTypes1(RetrieveAllPolicyTypes1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
