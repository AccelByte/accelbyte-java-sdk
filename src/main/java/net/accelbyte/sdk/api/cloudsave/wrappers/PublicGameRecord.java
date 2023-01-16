/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicGameRecord {

  private AccelByteSDK sdk;

  public PublicGameRecord(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetGameRecordsBulk
   */
  public ModelsBulkGetGameRecordResponse getGameRecordsBulk(GetGameRecordsBulk input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGameRecordHandlerV1
   */
  public ModelsGameRecordResponse getGameRecordHandlerV1(GetGameRecordHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PutGameRecordHandlerV1
   */
  public ModelsGameRecordResponse putGameRecordHandlerV1(PutGameRecordHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PostGameRecordHandlerV1
   */
  public ModelsGameRecordResponse postGameRecordHandlerV1(PostGameRecordHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteGameRecordHandlerV1
   */
  public void deleteGameRecordHandlerV1(DeleteGameRecordHandlerV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
