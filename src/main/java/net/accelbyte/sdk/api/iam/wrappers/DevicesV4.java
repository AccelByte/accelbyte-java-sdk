/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.devices_v4.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class DevicesV4 {

  private AccelByteSDK sdk;

  public DevicesV4(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetDevicesByUserV4
   */
  public ModelDevicesResponseV4 adminGetDevicesByUserV4(AdminGetDevicesByUserV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetBannedDevicesV4
   */
  public ModelDeviceBannedResponseV4 adminGetBannedDevicesV4(AdminGetBannedDevicesV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserDeviceBansV4
   */
  public ModelDeviceBansResponseV4 adminGetUserDeviceBansV4(AdminGetUserDeviceBansV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBanDeviceV4
   */
  public void adminBanDeviceV4(AdminBanDeviceV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetDeviceBanV4
   */
  public ModelDeviceBanResponseV4 adminGetDeviceBanV4(AdminGetDeviceBanV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateDeviceBanV4
   */
  public void adminUpdateDeviceBanV4(AdminUpdateDeviceBanV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGenerateReportV4
   */
  public void adminGenerateReportV4(AdminGenerateReportV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetDeviceTypesV4
   */
  public ModelDeviceTypesResponseV4 adminGetDeviceTypesV4(AdminGetDeviceTypesV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetDeviceBansV4
   */
  public ModelDeviceBansResponseV4 adminGetDeviceBansV4(AdminGetDeviceBansV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDecryptDeviceV4
   */
  public ModelDeviceIDDecryptResponseV4 adminDecryptDeviceV4(AdminDecryptDeviceV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUnbanDeviceV4
   */
  public void adminUnbanDeviceV4(AdminUnbanDeviceV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUsersByDeviceV4
   */
  public ModelDeviceUsersResponseV4 adminGetUsersByDeviceV4(AdminGetUsersByDeviceV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
