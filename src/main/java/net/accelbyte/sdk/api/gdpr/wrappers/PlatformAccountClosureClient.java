/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.wrappers;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operations.platform_account_closure_client.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PlatformAccountClosureClient {

  private AccelByteSDK sdk;

  public PlatformAccountClosureClient(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetPlatformAccountClosureClients
   */
  public DtoPlatformAccountClosureClientsResponse adminGetPlatformAccountClosureClients(
      AdminGetPlatformAccountClosureClients input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminValidateXboxBPCertFile
   */
  public DtoXboxBPCertValidationResponse adminValidateXboxBPCertFile(
      AdminValidateXboxBPCertFile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetPlatformAccountClosureClient
   */
  public DtoPlatformAccountClosureClientResponse adminGetPlatformAccountClosureClient(
      AdminGetPlatformAccountClosureClient input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdatePlatformAccountClosureClient
   */
  public void adminUpdatePlatformAccountClosureClient(AdminUpdatePlatformAccountClosureClient input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeletePlatformAccountClosureClient
   */
  public void adminDeletePlatformAccountClosureClient(AdminDeletePlatformAccountClosureClient input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminMockPlatformAccountClosureData
   */
  public void adminMockPlatformAccountClosureData(AdminMockPlatformAccountClosureData input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
