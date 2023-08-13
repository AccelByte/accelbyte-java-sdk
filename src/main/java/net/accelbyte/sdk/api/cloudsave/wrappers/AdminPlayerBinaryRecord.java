/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operations.admin_player_binary_record.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminPlayerBinaryRecord {

  private AccelByteSDK sdk;

  public AdminPlayerBinaryRecord(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListPlayerBinaryRecordsV1
   */
  public ModelsListPlayerBinaryRecordsResponse adminListPlayerBinaryRecordsV1(
      AdminListPlayerBinaryRecordsV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPostPlayerBinaryRecordV1
   */
  public ModelsUploadBinaryRecordResponse adminPostPlayerBinaryRecordV1(
      AdminPostPlayerBinaryRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetPlayerBinaryRecordV1
   */
  public ModelsPlayerBinaryRecordResponse adminGetPlayerBinaryRecordV1(
      AdminGetPlayerBinaryRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutPlayerBinaryRecordV1
   */
  public ModelsPlayerBinaryRecordResponse adminPutPlayerBinaryRecordV1(
      AdminPutPlayerBinaryRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeletePlayerBinaryRecordV1
   */
  public void adminDeletePlayerBinaryRecordV1(AdminDeletePlayerBinaryRecordV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutPlayerBinaryRecorMetadataV1
   */
  public ModelsPlayerBinaryRecordResponse adminPutPlayerBinaryRecorMetadataV1(
      AdminPutPlayerBinaryRecorMetadataV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPostPlayerBinaryPresignedURLV1
   */
  public ModelsUploadBinaryRecordResponse adminPostPlayerBinaryPresignedURLV1(
      AdminPostPlayerBinaryPresignedURLV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
