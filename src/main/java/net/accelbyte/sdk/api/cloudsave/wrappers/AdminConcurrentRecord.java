/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operations.admin_concurrent_record.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminConcurrentRecord {

  private AccelByteSDK sdk;

  public AdminConcurrentRecord(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminPutAdminGameRecordConcurrentHandlerV1
   */
  public void adminPutAdminGameRecordConcurrentHandlerV1(
      AdminPutAdminGameRecordConcurrentHandlerV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutGameRecordConcurrentHandlerV1
   */
  public void adminPutGameRecordConcurrentHandlerV1(AdminPutGameRecordConcurrentHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutAdminPlayerRecordConcurrentHandlerV1
   */
  public ModelsPlayerRecordConcurrentUpdateResponse adminPutAdminPlayerRecordConcurrentHandlerV1(
      AdminPutAdminPlayerRecordConcurrentHandlerV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutPlayerRecordConcurrentHandlerV1
   */
  public ModelsPlayerRecordConcurrentUpdateResponse adminPutPlayerRecordConcurrentHandlerV1(
      AdminPutPlayerRecordConcurrentHandlerV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutPlayerPublicRecordConcurrentHandlerV1
   */
  public ModelsPlayerRecordConcurrentUpdateResponse adminPutPlayerPublicRecordConcurrentHandlerV1(
      AdminPutPlayerPublicRecordConcurrentHandlerV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
