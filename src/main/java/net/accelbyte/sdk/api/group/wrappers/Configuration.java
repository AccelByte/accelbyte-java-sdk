/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.wrappers;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.operations.configuration.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Configuration {

  private AccelByteSDK sdk;

  public Configuration(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see ListGroupConfigurationAdminV1
   */
  public ModelsListConfigurationResponseV1 listGroupConfigurationAdminV1(
      ListGroupConfigurationAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateGroupConfigurationAdminV1
   */
  public ModelsCreateGroupConfigurationResponseV1 createGroupConfigurationAdminV1(
      CreateGroupConfigurationAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see InitiateGroupConfigurationAdminV1
   */
  public ModelsCreateGroupConfigurationResponseV1 initiateGroupConfigurationAdminV1(
      InitiateGroupConfigurationAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGroupConfigurationAdminV1
   */
  public ModelsGetGroupConfigurationResponseV1 getGroupConfigurationAdminV1(
      GetGroupConfigurationAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteGroupConfigurationV1
   */
  public void deleteGroupConfigurationV1(DeleteGroupConfigurationV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateGroupConfigurationAdminV1
   */
  public ModelsUpdateGroupConfigurationResponseV1 updateGroupConfigurationAdminV1(
      UpdateGroupConfigurationAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateGroupConfigurationGlobalRuleAdminV1
   */
  public ModelsUpdateGroupConfigurationResponseV1 updateGroupConfigurationGlobalRuleAdminV1(
      UpdateGroupConfigurationGlobalRuleAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteGroupConfigurationGlobalRuleAdminV1
   */
  public ModelsUpdateGroupConfigurationResponseV1 deleteGroupConfigurationGlobalRuleAdminV1(
      DeleteGroupConfigurationGlobalRuleAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
