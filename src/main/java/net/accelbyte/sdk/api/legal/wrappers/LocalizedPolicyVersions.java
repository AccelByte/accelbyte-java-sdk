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
import net.accelbyte.sdk.api.legal.operations.localized_policy_versions.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class LocalizedPolicyVersions {

  private AccelByteSDK sdk;

  public LocalizedPolicyVersions(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see RetrieveLocalizedPolicyVersions
   */
  public List<RetrieveLocalizedPolicyVersionResponse> retrieveLocalizedPolicyVersions(
      RetrieveLocalizedPolicyVersions input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateLocalizedPolicyVersion
   */
  public CreateLocalizedPolicyVersionResponse createLocalizedPolicyVersion(
      CreateLocalizedPolicyVersion input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveSingleLocalizedPolicyVersion
   */
  public RetrieveLocalizedPolicyVersionResponse retrieveSingleLocalizedPolicyVersion(
      RetrieveSingleLocalizedPolicyVersion input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateLocalizedPolicyVersion
   */
  public UpdateLocalizedPolicyVersionResponse updateLocalizedPolicyVersion(
      UpdateLocalizedPolicyVersion input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RequestPresignedURL
   */
  public UploadLocalizedPolicyVersionAttachmentResponse requestPresignedURL(
      RequestPresignedURL input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SetDefaultPolicy
   */
  public void setDefaultPolicy(SetDefaultPolicy input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveSingleLocalizedPolicyVersion2
   */
  public RetrieveLocalizedPolicyVersionPublicResponse retrieveSingleLocalizedPolicyVersion2(
      RetrieveSingleLocalizedPolicyVersion2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
