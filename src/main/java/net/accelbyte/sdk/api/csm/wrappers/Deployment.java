/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.wrappers;

import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.api.csm.operations.deployment.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Deployment {

  private AccelByteSDK sdk;

  public Deployment(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see CreateDeploymentV1
   * @deprecated
   */
  @Deprecated
  public GeneratedCreateDeploymentV1Response createDeploymentV1(CreateDeploymentV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetListOfDeploymentV1
   * @deprecated
   */
  @Deprecated
  public GeneratedGetDeploymentListV1Response getListOfDeploymentV1(GetListOfDeploymentV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetDeploymentV1
   * @deprecated
   */
  @Deprecated
  public GeneratedGetDeploymentV1Response getDeploymentV1(GetDeploymentV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteDeploymentV1
   * @deprecated
   */
  @Deprecated
  public void deleteDeploymentV1(DeleteDeploymentV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
