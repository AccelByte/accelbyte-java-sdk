/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.wrappers;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.operations.group.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Group {

  private AccelByteSDK sdk;

  public Group(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetGroupListAdminV1
   */
  public ModelsGetGroupsListResponseV1 getGroupListAdminV1(GetGroupListAdminV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSingleGroupAdminV1
   */
  public ModelsGroupResponseV1 getSingleGroupAdminV1(GetSingleGroupAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteGroupAdminV1
   */
  public void deleteGroupAdminV1(DeleteGroupAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGroupListPublicV1
   */
  public ModelsGetGroupsListResponseV1 getGroupListPublicV1(GetGroupListPublicV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateNewGroupPublicV1
   */
  public ModelsGroupResponseV1 createNewGroupPublicV1(CreateNewGroupPublicV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSingleGroupPublicV1
   */
  public ModelsGroupResponseV1 getSingleGroupPublicV1(GetSingleGroupPublicV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateSingleGroupV1
   */
  public ModelsGroupResponseV1 updateSingleGroupV1(UpdateSingleGroupV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteGroupPublicV1
   */
  public void deleteGroupPublicV1(DeleteGroupPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdatePatchSingleGroupPublicV1
   */
  public ModelsGroupResponseV1 updatePatchSingleGroupPublicV1(UpdatePatchSingleGroupPublicV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateGroupCustomAttributesPublicV1
   */
  public ModelsGroupResponseV1 updateGroupCustomAttributesPublicV1(
      UpdateGroupCustomAttributesPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateGroupCustomRulePublicV1
   */
  public ModelsGroupResponseV1 updateGroupCustomRulePublicV1(UpdateGroupCustomRulePublicV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateGroupPredefinedRulePublicV1
   */
  public ModelsGroupResponseV1 updateGroupPredefinedRulePublicV1(
      UpdateGroupPredefinedRulePublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteGroupPredefinedRulePublicV1
   */
  public void deleteGroupPredefinedRulePublicV1(DeleteGroupPredefinedRulePublicV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetListGroupByIDsAdminV2
   */
  public ModelsGetGroupsResponseV1 getListGroupByIDsAdminV2(GetListGroupByIDsAdminV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateNewGroupPublicV2
   */
  public ModelsGroupResponseV1 createNewGroupPublicV2(CreateNewGroupPublicV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetListGroupByIDsV2
   */
  public ModelsGetGroupsResponseV1 getListGroupByIDsV2(GetListGroupByIDsV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdatePutSingleGroupPublicV2
   */
  public ModelsGroupResponseV1 updatePutSingleGroupPublicV2(UpdatePutSingleGroupPublicV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteGroupPublicV2
   */
  public void deleteGroupPublicV2(DeleteGroupPublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdatePatchSingleGroupPublicV2
   */
  public ModelsGroupResponseV1 updatePatchSingleGroupPublicV2(UpdatePatchSingleGroupPublicV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateGroupCustomAttributesPublicV2
   */
  public ModelsGroupResponseV1 updateGroupCustomAttributesPublicV2(
      UpdateGroupCustomAttributesPublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateGroupCustomRulePublicV2
   */
  public ModelsGroupResponseV1 updateGroupCustomRulePublicV2(UpdateGroupCustomRulePublicV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateGroupPredefinedRulePublicV2
   */
  public ModelsGroupResponseV1 updateGroupPredefinedRulePublicV2(
      UpdateGroupPredefinedRulePublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteGroupPredefinedRulePublicV2
   */
  public void deleteGroupPredefinedRulePublicV2(DeleteGroupPredefinedRulePublicV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
