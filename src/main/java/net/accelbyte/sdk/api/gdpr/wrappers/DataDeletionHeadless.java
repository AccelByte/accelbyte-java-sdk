/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.wrappers;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operations.data_deletion_headless.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class DataDeletionHeadless {

  private AccelByteSDK sdk;

  public DataDeletionHeadless(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see PublicSubmitMyAccountDeletionRequest
   */
  public ModelsRequestDeleteResponse publicSubmitMyAccountDeletionRequest(
      PublicSubmitMyAccountDeletionRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCancelMyAccountDeletionRequest
   */
  public void publicCancelMyAccountDeletionRequest(PublicCancelMyAccountDeletionRequest input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyAccountDeletionStatus
   */
  public ModelsDeletionStatus publicGetMyAccountDeletionStatus(
      PublicGetMyAccountDeletionStatus input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicSubmitMyHeadlessDeletionRequest
   */
  public ModelsRequestDeleteResponse publicSubmitMyHeadlessDeletionRequest(
      PublicSubmitMyHeadlessDeletionRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
