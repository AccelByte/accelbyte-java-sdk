/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.sso_credential.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class SSOCredential {

  private AccelByteSDK sdk;

  public SSOCredential(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see RetrieveAllSSOLoginPlatformCredentialV3
   */
  public List<ModelSSOPlatformCredentialResponse> retrieveAllSSOLoginPlatformCredentialV3(
      RetrieveAllSSOLoginPlatformCredentialV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveSSOLoginPlatformCredential
   */
  public ModelSSOPlatformCredentialResponse retrieveSSOLoginPlatformCredential(
      RetrieveSSOLoginPlatformCredential input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AddSSOLoginPlatformCredential
   */
  public ModelSSOPlatformCredentialResponse addSSOLoginPlatformCredential(
      AddSSOLoginPlatformCredential input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteSSOLoginPlatformCredentialV3
   */
  public void deleteSSOLoginPlatformCredentialV3(DeleteSSOLoginPlatformCredentialV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateSSOPlatformCredential
   */
  public ModelSSOPlatformCredentialResponse updateSSOPlatformCredential(
      UpdateSSOPlatformCredential input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
