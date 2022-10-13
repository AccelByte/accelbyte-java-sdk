/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.wrappers;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operations.data_deletion.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class DataDeletion {

  private AccelByteSDK sdk;

  public DataDeletion(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetListDeletionDataRequest
   */
  public ModelsListDeletionDataResponse adminGetListDeletionDataRequest(
      AdminGetListDeletionDataRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserAccountDeletionRequest
   */
  public ModelsDeletionData adminGetUserAccountDeletionRequest(
      AdminGetUserAccountDeletionRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSubmitUserAccountDeletionRequest
   */
  public ModelsRequestDeleteResponse adminSubmitUserAccountDeletionRequest(
      AdminSubmitUserAccountDeletionRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCancelUserAccountDeletionRequest
   */
  public void adminCancelUserAccountDeletionRequest(AdminCancelUserAccountDeletionRequest input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicSubmitUserAccountDeletionRequest
   */
  public ModelsRequestDeleteResponse publicSubmitUserAccountDeletionRequest(
      PublicSubmitUserAccountDeletionRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCancelUserAccountDeletionRequest
   */
  public void publicCancelUserAccountDeletionRequest(PublicCancelUserAccountDeletionRequest input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserAccountDeletionStatus
   */
  public ModelsDeletionStatus publicGetUserAccountDeletionStatus(
      PublicGetUserAccountDeletionStatus input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
