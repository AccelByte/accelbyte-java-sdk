/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.wrappers;

import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.api.csm.operations.managed_resources_sql.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class ManagedResourcesSQL {

  private AccelByteSDK sdk;

  public ManagedResourcesSQL(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see CreateSQLDatabaseCredentialV2
   */
  public ApimodelSQLDatabaseCredentialResponse createSQLDatabaseCredentialV2(
      CreateSQLDatabaseCredentialV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSQLDatabaseV2
   */
  public ApimodelSQLDatabaseResponse getSQLDatabaseV2(GetSQLDatabaseV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateSQLDatabaseV2
   */
  public ApimodelSQLDatabaseResponse createSQLDatabaseV2(CreateSQLDatabaseV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteSQLDatabaseV2
   */
  public ApimodelSQLDatabaseDeleteResponse deleteSQLDatabaseV2(DeleteSQLDatabaseV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSQLClusterV2
   */
  public ApimodelSQLResourceResponse getSQLClusterV2(GetSQLClusterV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateSQLClusterV2
   */
  public ApimodelSQLResourceResponse updateSQLClusterV2(UpdateSQLClusterV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateSQLClusterV2
   */
  public ApimodelSQLResourceResponse createSQLClusterV2(CreateSQLClusterV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteSQLClusterV2
   */
  public ApimodelDeleteSQLResourceResponse deleteSQLClusterV2(DeleteSQLClusterV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see StartSQLClusterV2
   */
  public void startSQLClusterV2(StartSQLClusterV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see StopSQLClusterV2
   */
  public void stopSQLClusterV2(StopSQLClusterV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSQLAppListV2
   */
  public ApimodelSQLAppListResponse getSQLAppListV2(GetSQLAppListV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
