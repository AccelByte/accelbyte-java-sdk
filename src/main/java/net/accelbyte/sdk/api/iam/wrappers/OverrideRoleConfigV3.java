/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.override_role_config_v3.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class OverrideRoleConfigV3 {

  private AccelByteSDK sdk;

  public OverrideRoleConfigV3(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetRoleOverrideConfigV3
   */
  public ModelRoleOverrideResponse adminGetRoleOverrideConfigV3(AdminGetRoleOverrideConfigV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateRoleOverrideConfigV3
   */
  public ModelRoleOverrideResponse adminUpdateRoleOverrideConfigV3(
      AdminUpdateRoleOverrideConfigV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetRoleSourceV3
   */
  public ModelRoleOverrideSourceResponse adminGetRoleSourceV3(AdminGetRoleSourceV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminChangeRoleOverrideConfigStatusV3
   */
  public ModelRoleOverrideResponse adminChangeRoleOverrideConfigStatusV3(
      AdminChangeRoleOverrideConfigStatusV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetRoleNamespacePermissionV3
   */
  public ModelRolePermissionResponseV3 adminGetRoleNamespacePermissionV3(
      AdminGetRoleNamespacePermissionV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
