/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.wrappers;

import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.api.csm.operations.managed_resources.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class ManagedResources {

  private AccelByteSDK sdk;

  public ManagedResources(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see CreateNoSQLDatabaseCredentialV2
   */
  public ApimodelNoSQLDatabaseCredentialResponse createNoSQLDatabaseCredentialV2(
      CreateNoSQLDatabaseCredentialV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetNoSQLDatabaseV2
   */
  public ApimodelNoSQLDatabaseResponse getNoSQLDatabaseV2(GetNoSQLDatabaseV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateNoSQLDatabaseV2
   */
  public ApimodelNoSQLDatabaseResponse createNoSQLDatabaseV2(CreateNoSQLDatabaseV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteNoSQLDatabaseV2
   */
  public ApimodelNoSQLDatabaseDeleteResponse deleteNoSQLDatabaseV2(DeleteNoSQLDatabaseV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetNoSQLClusterV2
   */
  public ApimodelNoSQLResourceResponse getNoSQLClusterV2(GetNoSQLClusterV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateNoSQLClusterV2
   */
  public ApimodelNoSQLResourceResponse updateNoSQLClusterV2(UpdateNoSQLClusterV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateNoSQLClusterV2
   */
  public ApimodelNoSQLResourceResponse createNoSQLClusterV2(CreateNoSQLClusterV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteNoSQLClusterV2
   */
  public ApimodelDeleteNoSQLResourceResponse deleteNoSQLClusterV2(DeleteNoSQLClusterV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetNoSQLAccessTunnelV2
   */
  public ApimodelTunnelInfoResponse getNoSQLAccessTunnelV2(GetNoSQLAccessTunnelV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
