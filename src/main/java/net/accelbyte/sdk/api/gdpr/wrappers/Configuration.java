/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operations.configuration.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Configuration {

  private AccelByteSDK sdk;

  public Configuration(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetAdminEmailConfiguration
   */
  public List<String> getAdminEmailConfiguration(GetAdminEmailConfiguration input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateAdminEmailConfiguration
   */
  public void updateAdminEmailConfiguration(UpdateAdminEmailConfiguration input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SaveAdminEmailConfiguration
   */
  public void saveAdminEmailConfiguration(SaveAdminEmailConfiguration input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteAdminEmailConfiguration
   */
  public void deleteAdminEmailConfiguration(DeleteAdminEmailConfiguration input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetServicesConfiguration
   */
  public DtoServicesConfigurationResponse adminGetServicesConfiguration(
      AdminGetServicesConfiguration input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateServicesConfiguration
   */
  public DtoServiceConfigurationUpdateRequest adminUpdateServicesConfiguration(
      AdminUpdateServicesConfiguration input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminResetServicesConfiguration
   */
  public void adminResetServicesConfiguration(AdminResetServicesConfiguration input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
