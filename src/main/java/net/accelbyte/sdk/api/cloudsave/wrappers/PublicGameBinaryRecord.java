/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_binary_record.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicGameBinaryRecord {

  private AccelByteSDK sdk;

  public PublicGameBinaryRecord(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see ListGameBinaryRecordsV1
   */
  public ModelsListGameBinaryRecordsResponse listGameBinaryRecordsV1(ListGameBinaryRecordsV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PostGameBinaryRecordV1
   */
  public ModelsUploadBinaryRecordResponse postGameBinaryRecordV1(PostGameBinaryRecordV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkGetGameBinaryRecordV1
   */
  public ModelsBulkGetGameBinaryRecordResponse bulkGetGameBinaryRecordV1(
      BulkGetGameBinaryRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGameBinaryRecordV1
   */
  public ModelsGameBinaryRecordResponse getGameBinaryRecordV1(GetGameBinaryRecordV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PutGameBinaryRecordV1
   */
  public ModelsGameBinaryRecordResponse putGameBinaryRecordV1(PutGameBinaryRecordV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteGameBinaryRecordV1
   */
  public void deleteGameBinaryRecordV1(DeleteGameBinaryRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PostGameBinaryPresignedURLV1
   */
  public ModelsUploadBinaryRecordResponse postGameBinaryPresignedURLV1(
      PostGameBinaryPresignedURLV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
