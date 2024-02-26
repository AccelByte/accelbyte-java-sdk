/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.clients_config_v3.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class ClientsConfigV3 {

  private AccelByteSDK sdk;

  public ClientsConfigV3(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListClientAvailablePermissions
   */
  public ClientmodelListClientPermissionSet adminListClientAvailablePermissions(
      AdminListClientAvailablePermissions input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateAvailablePermissionsByModule
   */
  public void adminUpdateAvailablePermissionsByModule(AdminUpdateAvailablePermissionsByModule input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteConfigPermissionsByGroup
   */
  public void adminDeleteConfigPermissionsByGroup(AdminDeleteConfigPermissionsByGroup input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminListClientTemplates
   */
  public ClientmodelListTemplatesResponse adminListClientTemplates(AdminListClientTemplates input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
