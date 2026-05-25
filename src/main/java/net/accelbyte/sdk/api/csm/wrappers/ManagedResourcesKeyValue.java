/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.wrappers;

import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.api.csm.operations.managed_resources_key_value.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class ManagedResourcesKeyValue {

  private AccelByteSDK sdk;

  public ManagedResourcesKeyValue(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see CreateKeyValueCredentialV2
   */
  public ApimodelCreateKeyValueCredentialResponse createKeyValueCredentialV2(
      CreateKeyValueCredentialV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetIntegrationAppKeyValueClusterV2
   */
  public ApimodelGetIntegrationAppKeyValueResponse getIntegrationAppKeyValueClusterV2(
      GetIntegrationAppKeyValueClusterV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see IntegrateAppKeyValueClusterV2
   */
  public ApimodelIntegrateAppKeyValueResponse integrateAppKeyValueClusterV2(
      IntegrateAppKeyValueClusterV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RemoveIntegrationAppKeyValueClusterV2
   */
  public void removeIntegrationAppKeyValueClusterV2(RemoveIntegrationAppKeyValueClusterV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetKeyValueClusterV2
   */
  public ApimodelKeyValueResourceResponse getKeyValueClusterV2(GetKeyValueClusterV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListKeyValueClusterV2
   */
  public ApimodelKeyValueResourceListResponse listKeyValueClusterV2(ListKeyValueClusterV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateKeyValueClusterV2
   */
  public ApimodelKeyValueResourceResponse createKeyValueClusterV2(CreateKeyValueClusterV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetKeyValueClusterLimitConfigV2
   */
  public DomainKeyValueClusterConfig getKeyValueClusterLimitConfigV2(
      GetKeyValueClusterLimitConfigV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateKeyValueClusterV2
   */
  public ApimodelKeyValueResourceResponse updateKeyValueClusterV2(UpdateKeyValueClusterV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteKeyValueClusterV2
   */
  public ApimodelKeyValueResourceResponse deleteKeyValueClusterV2(DeleteKeyValueClusterV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetListIntegratedAppKeyValueClusterV2
   */
  public ApimodelListIntegratedAppsKeyValueResponse getListIntegratedAppKeyValueClusterV2(
      GetListIntegratedAppKeyValueClusterV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
