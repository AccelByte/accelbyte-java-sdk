/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.service_plugin_config.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class ServicePluginConfig {

  private AccelByteSDK sdk;

  public ServicePluginConfig(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetLootBoxPluginConfig
   */
  public LootBoxPluginConfigInfo getLootBoxPluginConfig(GetLootBoxPluginConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateLootBoxPluginConfig
   */
  public LootBoxPluginConfigInfo updateLootBoxPluginConfig(UpdateLootBoxPluginConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteLootBoxPluginConfig
   */
  public void deleteLootBoxPluginConfig(DeleteLootBoxPluginConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UplodLootBoxPluginConfigCert
   */
  public LootBoxPluginConfigInfo uplodLootBoxPluginConfigCert(UplodLootBoxPluginConfigCert input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetLootBoxGrpcInfo
   */
  public GrpcServerInfo getLootBoxGrpcInfo(GetLootBoxGrpcInfo input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSectionPluginConfig
   */
  public SectionPluginConfigInfo getSectionPluginConfig(GetSectionPluginConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateSectionPluginConfig
   */
  public SectionPluginConfigInfo updateSectionPluginConfig(UpdateSectionPluginConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteSectionPluginConfig
   */
  public void deleteSectionPluginConfig(DeleteSectionPluginConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UploadSectionPluginConfigCert
   */
  public SectionPluginConfigInfo uploadSectionPluginConfigCert(UploadSectionPluginConfigCert input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetServicePluginConfig
   * @deprecated
   */
  @Deprecated
  public ServicePluginConfigInfo getServicePluginConfig(GetServicePluginConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateServicePluginConfig
   * @deprecated
   */
  @Deprecated
  public ServicePluginConfigInfo updateServicePluginConfig(UpdateServicePluginConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteServicePluginConfig
   * @deprecated
   */
  @Deprecated
  public void deleteServicePluginConfig(DeleteServicePluginConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetRevocationPluginConfig
   */
  public RevocationPluginConfigInfo getRevocationPluginConfig(GetRevocationPluginConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateRevocationPluginConfig
   */
  public RevocationPluginConfigInfo updateRevocationPluginConfig(UpdateRevocationPluginConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteRevocationPluginConfig
   */
  public void deleteRevocationPluginConfig(DeleteRevocationPluginConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UploadRevocationPluginConfigCert
   */
  public RevocationPluginConfigInfo uploadRevocationPluginConfigCert(
      UploadRevocationPluginConfigCert input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
