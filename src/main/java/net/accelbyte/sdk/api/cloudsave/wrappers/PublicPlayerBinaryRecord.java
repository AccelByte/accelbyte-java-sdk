/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operations.public_player_binary_record.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicPlayerBinaryRecord {

  private AccelByteSDK sdk;

  public PublicPlayerBinaryRecord(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see BulkGetPlayerPublicBinaryRecordsV1
   */
  public ModelsBulkGetPlayerBinaryRecordResponse bulkGetPlayerPublicBinaryRecordsV1(
      BulkGetPlayerPublicBinaryRecordsV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListMyBinaryRecordsV1
   */
  public ModelsListPlayerBinaryRecordsResponse listMyBinaryRecordsV1(ListMyBinaryRecordsV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkGetMyBinaryRecordV1
   */
  public ModelsBulkGetPlayerBinaryRecordResponse bulkGetMyBinaryRecordV1(
      BulkGetMyBinaryRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PostPlayerBinaryRecordV1
   */
  public ModelsUploadBinaryRecordResponse postPlayerBinaryRecordV1(PostPlayerBinaryRecordV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListOtherPlayerPublicBinaryRecordsV1
   */
  public ModelsListPlayerBinaryRecordsResponse listOtherPlayerPublicBinaryRecordsV1(
      ListOtherPlayerPublicBinaryRecordsV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkGetOtherPlayerPublicBinaryRecordsV1
   */
  public ModelsBulkGetPlayerBinaryRecordResponse bulkGetOtherPlayerPublicBinaryRecordsV1(
      BulkGetOtherPlayerPublicBinaryRecordsV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPlayerBinaryRecordV1
   */
  public ModelsPlayerBinaryRecordResponse getPlayerBinaryRecordV1(GetPlayerBinaryRecordV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PutPlayerBinaryRecordV1
   */
  public ModelsPlayerBinaryRecordResponse putPlayerBinaryRecordV1(PutPlayerBinaryRecordV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeletePlayerBinaryRecordV1
   */
  public void deletePlayerBinaryRecordV1(DeletePlayerBinaryRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PutPlayerBinaryRecorMetadataV1
   */
  public ModelsPlayerBinaryRecordResponse putPlayerBinaryRecorMetadataV1(
      PutPlayerBinaryRecorMetadataV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PostPlayerBinaryPresignedURLV1
   */
  public ModelsUploadBinaryRecordResponse postPlayerBinaryPresignedURLV1(
      PostPlayerBinaryPresignedURLV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPlayerPublicBinaryRecordsV1
   */
  public ModelsPlayerBinaryRecordResponse getPlayerPublicBinaryRecordsV1(
      GetPlayerPublicBinaryRecordsV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
