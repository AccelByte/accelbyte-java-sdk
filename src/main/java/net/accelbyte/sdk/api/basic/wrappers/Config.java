/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.wrappers;

import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.operations.config.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Config {

  private AccelByteSDK sdk;

  public Config(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see CreateConfig
   */
  public ConfigInfo createConfig(CreateConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetConfig1
   */
  public ConfigInfo getConfig1(GetConfig1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteConfig1
   */
  public void deleteConfig1(DeleteConfig1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateConfig1
   */
  public ConfigInfo updateConfig1(UpdateConfig1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPublisherConfig
   */
  public ConfigInfo getPublisherConfig(GetPublisherConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
