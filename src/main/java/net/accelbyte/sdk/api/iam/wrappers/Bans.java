/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.bans.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Bans {

  private AccelByteSDK sdk;

  public Bans(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetBansType
   * @deprecated
   */
  @Deprecated
  public AccountcommonBans getBansType(GetBansType input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetListBanReason
   * @deprecated
   */
  @Deprecated
  public AccountcommonBanReasons getListBanReason(GetListBanReason input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetBansTypeV3
   */
  public AccountcommonBansV3 adminGetBansTypeV3(AdminGetBansTypeV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetListBanReasonV3
   */
  public AccountcommonBanReasonsV3 adminGetListBanReasonV3(AdminGetListBanReasonV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetBannedUsersV3
   */
  public ModelGetUserBanV3Response adminGetBannedUsersV3(AdminGetBannedUsersV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBanUserBulkV3
   */
  public ModelListBulkUserBanResponseV3 adminBanUserBulkV3(AdminBanUserBulkV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUnbanUserBulkV3
   */
  public ModelListBulkUserBanResponseV3 adminUnbanUserBulkV3(AdminUnbanUserBulkV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetBansTypeWithNamespaceV3
   */
  public AccountcommonBansV3 adminGetBansTypeWithNamespaceV3(AdminGetBansTypeWithNamespaceV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
