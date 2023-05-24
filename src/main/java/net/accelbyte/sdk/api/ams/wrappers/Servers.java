/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.wrappers;

import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.api.ams.operations.servers.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Servers {

  private AccelByteSDK sdk;

  public Servers(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see FleetServerHistory
   */
  public ApiDSHistoryList fleetServerHistory(FleetServerHistory input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see FleetServerInfo
   */
  public ApiFleetServerInfoResponse fleetServerInfo(FleetServerInfo input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ServerHistory
   */
  public ApiFleetServerHistoryResponse serverHistory(ServerHistory input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
