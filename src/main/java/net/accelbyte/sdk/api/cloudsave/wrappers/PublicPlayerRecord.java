/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operations.public_player_record.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicPlayerRecord {

  private AccelByteSDK sdk;

  public PublicPlayerRecord(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see BulkGetPlayerPublicRecordHandlerV1
   */
  public ModelsBulkGetPlayerRecordResponse bulkGetPlayerPublicRecordHandlerV1(
      BulkGetPlayerPublicRecordHandlerV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrievePlayerRecords
   */
  public ModelsListPlayerRecordKeysResponse retrievePlayerRecords(RetrievePlayerRecords input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPlayerRecordsBulkHandlerV1
   */
  public ModelsBulkGetPlayerRecordResponse getPlayerRecordsBulkHandlerV1(
      GetPlayerRecordsBulkHandlerV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDeletePlayerPublicRecordHandlerV1
   */
  public void publicDeletePlayerPublicRecordHandlerV1(PublicDeletePlayerPublicRecordHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPlayerRecordHandlerV1
   */
  public ModelsPlayerRecordResponse getPlayerRecordHandlerV1(GetPlayerRecordHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PutPlayerRecordHandlerV1
   */
  public ModelsPlayerRecordResponse putPlayerRecordHandlerV1(PutPlayerRecordHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PostPlayerRecordHandlerV1
   */
  public ModelsPlayerRecordResponse postPlayerRecordHandlerV1(PostPlayerRecordHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeletePlayerRecordHandlerV1
   */
  public void deletePlayerRecordHandlerV1(DeletePlayerRecordHandlerV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPlayerPublicRecordHandlerV1
   */
  public ModelsPlayerRecordResponse getPlayerPublicRecordHandlerV1(
      GetPlayerPublicRecordHandlerV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PutPlayerPublicRecordHandlerV1
   */
  public ModelsPlayerRecordResponse putPlayerPublicRecordHandlerV1(
      PutPlayerPublicRecordHandlerV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PostPlayerPublicRecordHandlerV1
   */
  public ModelsPlayerRecordResponse postPlayerPublicRecordHandlerV1(
      PostPlayerPublicRecordHandlerV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
