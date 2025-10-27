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
   * @see OldCreatePolicy
   */
  public CreateBasePolicyResponse oldCreatePolicy(OldCreatePolicy input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldRetrieveSinglePolicy
   */
  public RetrieveBasePolicyResponse oldRetrieveSinglePolicy(OldRetrieveSinglePolicy input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldPartialUpdatePolicy
   */
  public UpdateBasePolicyResponse oldPartialUpdatePolicy(OldPartialUpdatePolicy input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldRetrievePolicyCountry
   */
  public RetrievePolicyResponse oldRetrievePolicyCountry(OldRetrievePolicyCountry input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldRetrieveAllPolicyTypes
   */
  public List<RetrievePolicyTypeResponse> oldRetrieveAllPolicyTypes(OldRetrieveAllPolicyTypes input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
