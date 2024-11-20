/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.wrappers;

import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.api.csm.operations.app.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class App {

  private AccelByteSDK sdk;

  public App(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetAppListV1
   * @deprecated
   */
  @Deprecated
  public GeneratedGetAppListV1Response getAppListV1(GetAppListV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAppV1
   * @deprecated
   */
  @Deprecated
  public GeneratedGetAppV1Response getAppV1(GetAppV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateAppV1
   * @deprecated
   */
  @Deprecated
  public GeneratedCreateAppV1Response createAppV1(CreateAppV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteAppV1
   * @deprecated
   */
  @Deprecated
  public void deleteAppV1(DeleteAppV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateAppV1
   * @deprecated
   */
  @Deprecated
  public GeneratedUpdateAppV1Response updateAppV1(UpdateAppV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAppReleaseV1
   */
  public GeneratedGetAppReleaseV1Response getAppReleaseV1(GetAppReleaseV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see StartAppV1
   * @deprecated
   */
  @Deprecated
  public GeneratedStartAppV1Response startAppV1(StartAppV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see StopAppV1
   * @deprecated
   */
  @Deprecated
  public GeneratedStopAppV1Response stopAppV1(StopAppV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
