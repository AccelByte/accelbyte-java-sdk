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
import net.accelbyte.sdk.api.iam.operations.third_party_credential.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class ThirdPartyCredential {

  private AccelByteSDK sdk;

  public ThirdPartyCredential(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see RetrieveAllThirdPartyLoginPlatformCredentialV3
   */
  public List<ModelThirdPartyLoginPlatformCredentialResponse>
      retrieveAllThirdPartyLoginPlatformCredentialV3(
          RetrieveAllThirdPartyLoginPlatformCredentialV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
   */
  public List<ModelThirdPartyLoginPlatformCredentialResponse>
      retrieveAllActiveThirdPartyLoginPlatformCredentialV3(
          RetrieveAllActiveThirdPartyLoginPlatformCredentialV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveThirdPartyLoginPlatformCredentialV3
   */
  public ModelThirdPartyLoginPlatformCredentialResponse retrieveThirdPartyLoginPlatformCredentialV3(
      RetrieveThirdPartyLoginPlatformCredentialV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AddThirdPartyLoginPlatformCredentialV3
   */
  public ModelThirdPartyLoginPlatformCredentialResponse addThirdPartyLoginPlatformCredentialV3(
      AddThirdPartyLoginPlatformCredentialV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteThirdPartyLoginPlatformCredentialV3
   */
  public void deleteThirdPartyLoginPlatformCredentialV3(
      DeleteThirdPartyLoginPlatformCredentialV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateThirdPartyLoginPlatformCredentialV3
   */
  public ModelThirdPartyLoginPlatformCredentialResponse updateThirdPartyLoginPlatformCredentialV3(
      UpdateThirdPartyLoginPlatformCredentialV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateThirdPartyLoginPlatformDomainV3
   */
  public ModelPlatformDomainResponse updateThirdPartyLoginPlatformDomainV3(
      UpdateThirdPartyLoginPlatformDomainV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteThirdPartyLoginPlatformDomainV3
   */
  public void deleteThirdPartyLoginPlatformDomainV3(DeleteThirdPartyLoginPlatformDomainV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
   */
  public List<ModelPublicThirdPartyPlatformInfo>
      retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3(
          RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveActiveOIDCClientsPublicV3
   */
  public List<ModelPublicThirdPartyPlatformInfo> retrieveActiveOIDCClientsPublicV3(
      RetrieveActiveOIDCClientsPublicV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
