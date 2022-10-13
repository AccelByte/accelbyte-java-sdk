/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operations.admin_game_record.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminGameRecord {

  private AccelByteSDK sdk;

  public AdminGameRecord(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see ListGameRecordsHandlerV1
   */
  public ModelsListGameRecordKeysResponse listGameRecordsHandlerV1(ListGameRecordsHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetGameRecordHandlerV1
   */
  public ModelsGameRecordResponse adminGetGameRecordHandlerV1(AdminGetGameRecordHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutGameRecordHandlerV1
   */
  public ModelsGameRecordResponse adminPutGameRecordHandlerV1(AdminPutGameRecordHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPostGameRecordHandlerV1
   */
  public ModelsGameRecordResponse adminPostGameRecordHandlerV1(AdminPostGameRecordHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteGameRecordHandlerV1
   */
  public void adminDeleteGameRecordHandlerV1(AdminDeleteGameRecordHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
