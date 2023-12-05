/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operations.concurrent_record.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class ConcurrentRecord {

  private AccelByteSDK sdk;

  public ConcurrentRecord(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see PutGameRecordConcurrentHandlerV1
   */
  public void putGameRecordConcurrentHandlerV1(PutGameRecordConcurrentHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PutPlayerRecordConcurrentHandlerV1
   */
  public ModelsPlayerRecordConcurrentUpdateResponse putPlayerRecordConcurrentHandlerV1(
      PutPlayerRecordConcurrentHandlerV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PutPlayerPublicRecordConcurrentHandlerV1
   */
  public ModelsPlayerRecordConcurrentUpdateResponse putPlayerPublicRecordConcurrentHandlerV1(
      PutPlayerPublicRecordConcurrentHandlerV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
