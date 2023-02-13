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
import net.accelbyte.sdk.api.legal.operations.policy_versions_with_namespace.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PolicyVersionsWithNamespace {

  private AccelByteSDK sdk;

  public PolicyVersionsWithNamespace(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see UpdatePolicyVersion1
   */
  public UpdatePolicyVersionResponse updatePolicyVersion1(UpdatePolicyVersion1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublishPolicyVersion1
   */
  public void publishPolicyVersion1(PublishPolicyVersion1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveSinglePolicyVersion1
   */
  public List<RetrievePolicyVersionResponse> retrieveSinglePolicyVersion1(
      RetrieveSinglePolicyVersion1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreatePolicyVersion1
   */
  public CreatePolicyVersionResponse createPolicyVersion1(CreatePolicyVersion1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
