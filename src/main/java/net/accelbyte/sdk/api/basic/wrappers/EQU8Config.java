/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.wrappers;

import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.operations.equ8_config.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class EQU8Config {

  private AccelByteSDK sdk;

  public EQU8Config(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetConfig
   */
  public Equ8Config getConfig(GetConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteConfig
   */
  public void deleteConfig(DeleteConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateConfig
   */
  public Equ8Config updateConfig(UpdateConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
