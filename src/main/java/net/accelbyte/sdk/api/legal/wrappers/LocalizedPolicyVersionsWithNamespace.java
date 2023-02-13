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
import net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class LocalizedPolicyVersionsWithNamespace {

  private AccelByteSDK sdk;

  public LocalizedPolicyVersionsWithNamespace(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see RetrieveLocalizedPolicyVersions1
   */
  public List<RetrieveLocalizedPolicyVersionResponse> retrieveLocalizedPolicyVersions1(
      RetrieveLocalizedPolicyVersions1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateLocalizedPolicyVersion1
   */
  public CreateLocalizedPolicyVersionResponse createLocalizedPolicyVersion1(
      CreateLocalizedPolicyVersion1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveSingleLocalizedPolicyVersion1
   */
  public RetrieveLocalizedPolicyVersionResponse retrieveSingleLocalizedPolicyVersion1(
      RetrieveSingleLocalizedPolicyVersion1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateLocalizedPolicyVersion1
   */
  public UpdateLocalizedPolicyVersionResponse updateLocalizedPolicyVersion1(
      UpdateLocalizedPolicyVersion1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RequestPresignedURL1
   */
  public UploadLocalizedPolicyVersionAttachmentResponse requestPresignedURL1(
      RequestPresignedURL1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SetDefaultPolicy1
   */
  public void setDefaultPolicy1(SetDefaultPolicy1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveSingleLocalizedPolicyVersion3
   */
  public RetrieveLocalizedPolicyVersionPublicResponse retrieveSingleLocalizedPolicyVersion3(
      RetrieveSingleLocalizedPolicyVersion3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
