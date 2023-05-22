/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.wrappers;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.operations.deployment_config.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class DeploymentConfig {

  private AccelByteSDK sdk;

  public DeploymentConfig(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetAllDeployment
   */
  public ModelsListDeploymentResponse getAllDeployment(GetAllDeployment input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetDeployment
   */
  public ModelsDeploymentWithOverride getDeployment(GetDeployment input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateDeployment
   */
  public ModelsDeploymentWithOverride createDeployment(CreateDeployment input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteDeployment
   */
  public void deleteDeployment(DeleteDeployment input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateDeployment
   */
  public ModelsDeploymentWithOverride updateDeployment(UpdateDeployment input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateRootRegionOverride
   */
  public ModelsDeploymentWithOverride createRootRegionOverride(CreateRootRegionOverride input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteRootRegionOverride
   */
  public ModelsDeploymentWithOverride deleteRootRegionOverride(DeleteRootRegionOverride input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateRootRegionOverride
   */
  public ModelsDeploymentWithOverride updateRootRegionOverride(UpdateRootRegionOverride input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateDeploymentOverride
   */
  public ModelsDeploymentWithOverride createDeploymentOverride(CreateDeploymentOverride input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteDeploymentOverride
   */
  public ModelsDeploymentWithOverride deleteDeploymentOverride(DeleteDeploymentOverride input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateDeploymentOverride
   */
  public ModelsDeploymentWithOverride updateDeploymentOverride(UpdateDeploymentOverride input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateOverrideRegionOverride
   */
  public ModelsDeploymentWithOverride createOverrideRegionOverride(
      CreateOverrideRegionOverride input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteOverrideRegionOverride
   */
  public ModelsDeploymentWithOverride deleteOverrideRegionOverride(
      DeleteOverrideRegionOverride input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateOverrideRegionOverride
   */
  public ModelsDeploymentWithOverride updateOverrideRegionOverride(
      UpdateOverrideRegionOverride input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllDeploymentClient
   */
  public ModelsListDeploymentResponse getAllDeploymentClient(GetAllDeploymentClient input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateDeploymentClient
   */
  public ModelsDeploymentWithOverride createDeploymentClient(CreateDeploymentClient input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteDeploymentClient
   */
  public void deleteDeploymentClient(DeleteDeploymentClient input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
