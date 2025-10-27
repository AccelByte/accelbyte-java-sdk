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
   * @see OldRetrieveLocalizedPolicyVersions
   */
  public List<RetrieveLocalizedPolicyVersionResponse> oldRetrieveLocalizedPolicyVersions(
      OldRetrieveLocalizedPolicyVersions input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldCreateLocalizedPolicyVersion
   */
  public CreateLocalizedPolicyVersionResponse oldCreateLocalizedPolicyVersion(
      OldCreateLocalizedPolicyVersion input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldRetrieveSingleLocalizedPolicyVersion
   */
  public RetrieveLocalizedPolicyVersionResponse oldRetrieveSingleLocalizedPolicyVersion(
      OldRetrieveSingleLocalizedPolicyVersion input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldUpdateLocalizedPolicyVersion
   */
  public UpdateLocalizedPolicyVersionResponse oldUpdateLocalizedPolicyVersion(
      OldUpdateLocalizedPolicyVersion input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldRequestPresignedURL
   */
  public UploadLocalizedPolicyVersionAttachmentResponse oldRequestPresignedURL(
      OldRequestPresignedURL input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldSetDefaultLocalizedPolicy
   */
  public void oldSetDefaultLocalizedPolicy(OldSetDefaultLocalizedPolicy input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldPublicRetrieveSingleLocalizedPolicyVersion
   */
  public RetrieveLocalizedPolicyVersionPublicResponse oldPublicRetrieveSingleLocalizedPolicyVersion(
      OldPublicRetrieveSingleLocalizedPolicyVersion input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
