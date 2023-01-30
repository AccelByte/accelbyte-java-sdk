/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.operations.player.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Player {

  private AccelByteSDK sdk;

  public Player(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminQueryPlayerAttributes
   */
  public List<ApimodelsPlayerAttributesResponseBody> adminQueryPlayerAttributes(
      AdminQueryPlayerAttributes input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetPlayerAttributes
   */
  public ApimodelsPlayerAttributesResponseBody adminGetPlayerAttributes(
      AdminGetPlayerAttributes input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetPlayerAttributes
   */
  public ApimodelsPlayerAttributesResponseBody publicGetPlayerAttributes(
      PublicGetPlayerAttributes input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicStorePlayerAttributes
   */
  public ApimodelsPlayerAttributesResponseBody publicStorePlayerAttributes(
      PublicStorePlayerAttributes input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDeletePlayerAttributes
   */
  public void publicDeletePlayerAttributes(PublicDeletePlayerAttributes input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
