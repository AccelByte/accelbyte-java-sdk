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
import net.accelbyte.sdk.api.legal.operations.policy_versions.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PolicyVersions {

  private AccelByteSDK sdk;

  public PolicyVersions(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see UpdatePolicyVersion
   */
  public UpdatePolicyVersionResponse updatePolicyVersion(UpdatePolicyVersion input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublishPolicyVersion
   */
  public void publishPolicyVersion(PublishPolicyVersion input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveSinglePolicyVersion
   */
  public List<RetrievePolicyVersionResponse> retrieveSinglePolicyVersion(
      RetrieveSinglePolicyVersion input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreatePolicyVersion
   */
  public CreatePolicyVersionResponse createPolicyVersion(CreatePolicyVersion input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
