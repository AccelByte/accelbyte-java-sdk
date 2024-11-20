/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.wrappers;

import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.api.csm.operations.configuration.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Configuration {

  private AccelByteSDK sdk;

  public Configuration(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetListOfSecretsV1
   * @deprecated
   */
  @Deprecated
  public GeneratedGetListOfConfigurationsV1Response getListOfSecretsV1(GetListOfSecretsV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SaveSecretV1
   * @deprecated
   */
  @Deprecated
  public GeneratedSaveConfigurationV1Response saveSecretV1(SaveSecretV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateSecretV1
   * @deprecated
   */
  @Deprecated
  public GeneratedUpdateConfigurationV1Response updateSecretV1(UpdateSecretV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteSecretV1
   * @deprecated
   */
  @Deprecated
  public void deleteSecretV1(DeleteSecretV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetListOfVariablesV1
   * @deprecated
   */
  @Deprecated
  public GeneratedGetListOfConfigurationsV1Response getListOfVariablesV1(GetListOfVariablesV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SaveVariableV1
   * @deprecated
   */
  @Deprecated
  public GeneratedSaveConfigurationV1Response saveVariableV1(SaveVariableV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateVariableV1
   * @deprecated
   */
  @Deprecated
  public GeneratedUpdateConfigurationV1Response updateVariableV1(UpdateVariableV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteVariableV1
   * @deprecated
   */
  @Deprecated
  public void deleteVariableV1(DeleteVariableV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
