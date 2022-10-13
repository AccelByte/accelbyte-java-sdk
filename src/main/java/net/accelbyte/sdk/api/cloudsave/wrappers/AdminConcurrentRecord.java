/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.operations.admin_concurrent_record.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminConcurrentRecord {

  private AccelByteSDK sdk;

  public AdminConcurrentRecord(AccelByteSDK sdk) {
    this.sdk = sdk;
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
   * @see AdminPutPlayerRecordConcurrentHandlerV1
   */
  public void adminPutPlayerRecordConcurrentHandlerV1(AdminPutPlayerRecordConcurrentHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutPlayerPublicRecordConcurrentHandlerV1
   */
  public void adminPutPlayerPublicRecordConcurrentHandlerV1(
      AdminPutPlayerPublicRecordConcurrentHandlerV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
