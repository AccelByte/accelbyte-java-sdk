/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operations.admin_record.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminRecord {

  private AccelByteSDK sdk;

  public AdminRecord(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListAdminGameRecordV1
   */
  public ModelsListAdminGameRecordKeysResponse adminListAdminGameRecordV1(
      AdminListAdminGameRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkGetAdminGameRecordV1
   */
  public ModelsBulkGetAdminGameRecordResponse adminBulkGetAdminGameRecordV1(
      AdminBulkGetAdminGameRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetAdminGameRecordV1
   */
  public ModelsAdminGameRecordResponse adminGetAdminGameRecordV1(AdminGetAdminGameRecordV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutAdminGameRecordV1
   */
  public ModelsAdminGameRecordResponse adminPutAdminGameRecordV1(AdminPutAdminGameRecordV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPostAdminGameRecordV1
   */
  public ModelsAdminGameRecordResponse adminPostAdminGameRecordV1(AdminPostAdminGameRecordV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteAdminGameRecordV1
   */
  public void adminDeleteAdminGameRecordV1(AdminDeleteAdminGameRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkGetAdminPlayerRecordByUserIdsV1
   */
  public ModelsBulkGetAdminPlayerRecordResponse bulkGetAdminPlayerRecordByUserIdsV1(
      BulkGetAdminPlayerRecordByUserIdsV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminListAdminUserRecordsV1
   */
  public ModelsListAdminPlayerRecordKeysResponse adminListAdminUserRecordsV1(
      AdminListAdminUserRecordsV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkGetAdminPlayerRecordV1
   */
  public ModelsBulkGetAdminPlayerRecordResponse adminBulkGetAdminPlayerRecordV1(
      AdminBulkGetAdminPlayerRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetAdminPlayerRecordV1
   */
  public ModelsAdminPlayerRecordResponse adminGetAdminPlayerRecordV1(
      AdminGetAdminPlayerRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutAdminPlayerRecordV1
   */
  public ModelsAdminPlayerRecordResponse adminPutAdminPlayerRecordV1(
      AdminPutAdminPlayerRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPostPlayerAdminRecordV1
   */
  public ModelsAdminPlayerRecordResponse adminPostPlayerAdminRecordV1(
      AdminPostPlayerAdminRecordV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteAdminPlayerRecordV1
   */
  public void adminDeleteAdminPlayerRecordV1(AdminDeleteAdminPlayerRecordV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
