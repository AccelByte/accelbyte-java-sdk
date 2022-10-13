/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.wrappers;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.operations.admin_group.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminGroup {

  private AccelByteSDK sdk;

  public AdminGroup(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see SingleAdminGetAllGroups
   */
  public ModelsPaginatedGroupResponse singleAdminGetAllGroups(SingleAdminGetAllGroups input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateGroup
   */
  public ModelsCreateGroupResponse adminCreateGroup(AdminCreateGroup input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SingleAdminGetGroup
   */
  public ModelsCreateGroupResponse singleAdminGetGroup(SingleAdminGetGroup input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SingleAdminUpdateGroup
   */
  public ModelsCreateGroupResponse singleAdminUpdateGroup(SingleAdminUpdateGroup input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SingleAdminDeleteGroup
   */
  public void singleAdminDeleteGroup(SingleAdminDeleteGroup input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SingleAdminGetGroupContents
   */
  public ModelsPaginatedContentDownloadResponse singleAdminGetGroupContents(
      SingleAdminGetGroupContents input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetAllGroups
   */
  public ModelsPaginatedGroupResponse adminGetAllGroups(AdminGetAllGroups input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetGroup
   */
  public ModelsCreateGroupResponse adminGetGroup(AdminGetGroup input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateGroup
   */
  public ModelsCreateGroupResponse adminUpdateGroup(AdminUpdateGroup input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteGroup
   */
  public void adminDeleteGroup(AdminDeleteGroup input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetGroupContents
   */
  public ModelsPaginatedContentDownloadResponse adminGetGroupContents(AdminGetGroupContents input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
