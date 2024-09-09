/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.wrappers;

import net.accelbyte.sdk.api.challenge.models.*;
import net.accelbyte.sdk.api.challenge.operations.plugins.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Plugins {

  private AccelByteSDK sdk;

  public Plugins(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetAssignmentPlugin
   */
  public ModelPluginAssignmentResponse adminGetAssignmentPlugin(AdminGetAssignmentPlugin input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateAssignmentPlugin
   */
  public ModelPluginAssignmentResponse adminUpdateAssignmentPlugin(
      AdminUpdateAssignmentPlugin input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateAssignmentPlugin
   */
  public ModelPluginAssignmentResponse adminCreateAssignmentPlugin(
      AdminCreateAssignmentPlugin input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteAssignmentPlugin
   */
  public void adminDeleteAssignmentPlugin(AdminDeleteAssignmentPlugin input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
