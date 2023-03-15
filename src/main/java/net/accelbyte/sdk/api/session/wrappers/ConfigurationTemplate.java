/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.wrappers;

import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.operations.configuration_template.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class ConfigurationTemplate {

  private AccelByteSDK sdk;

  public ConfigurationTemplate(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminCreateConfigurationTemplateV1
   */
  public ApimodelsConfigurationTemplateResponse adminCreateConfigurationTemplateV1(
      AdminCreateConfigurationTemplateV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetAllConfigurationTemplatesV1
   */
  public ApimodelsConfigurationTemplatesResponse adminGetAllConfigurationTemplatesV1(
      AdminGetAllConfigurationTemplatesV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetConfigurationTemplateV1
   */
  public ApimodelsConfigurationTemplateResponse adminGetConfigurationTemplateV1(
      AdminGetConfigurationTemplateV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateConfigurationTemplateV1
   */
  public ApimodelsConfigurationTemplateResponse adminUpdateConfigurationTemplateV1(
      AdminUpdateConfigurationTemplateV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteConfigurationTemplateV1
   */
  public void adminDeleteConfigurationTemplateV1(AdminDeleteConfigurationTemplateV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetDSMCConfiguration
   */
  public ModelsDSMConfigRecord adminGetDSMCConfiguration(AdminGetDSMCConfiguration input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSyncDSMCConfiguration
   */
  public ModelsDSMConfigRecord adminSyncDSMCConfiguration(AdminSyncDSMCConfiguration input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
