/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operations.profanity.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Profanity {

  private AccelByteSDK sdk;

  public Profanity(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminDebugProfanityFilters
   */
  public List<ModelsProfanityFilter> adminDebugProfanityFilters(AdminDebugProfanityFilters input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetProfanityListFiltersV1
   */
  public ModelsAdminGetProfanityListFiltersV1Response adminGetProfanityListFiltersV1(
      AdminGetProfanityListFiltersV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAddProfanityFilterIntoList
   */
  public void adminAddProfanityFilterIntoList(AdminAddProfanityFilterIntoList input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAddProfanityFilters
   */
  public void adminAddProfanityFilters(AdminAddProfanityFilters input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminImportProfanityFiltersFromFile
   */
  public void adminImportProfanityFiltersFromFile(AdminImportProfanityFiltersFromFile input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteProfanityFilter
   */
  public List<ModelsProfanityFilter> adminDeleteProfanityFilter(AdminDeleteProfanityFilter input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetProfanityLists
   */
  public List<ModelsAdminGetProfanityListsListResponse> adminGetProfanityLists(
      AdminGetProfanityLists input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateProfanityList
   */
  public void adminCreateProfanityList(AdminCreateProfanityList input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateProfanityList
   */
  public void adminUpdateProfanityList(AdminUpdateProfanityList input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteProfanityList
   */
  public void adminDeleteProfanityList(AdminDeleteProfanityList input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetProfanityRule
   */
  public ModelsProfanityRule adminGetProfanityRule(AdminGetProfanityRule input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSetProfanityRuleForNamespace
   */
  public void adminSetProfanityRuleForNamespace(AdminSetProfanityRuleForNamespace input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminVerifyMessageProfanityResponse
   */
  public ModelsAdminVerifyMessageProfanityResponse adminVerifyMessageProfanityResponse(
      AdminVerifyMessageProfanityResponse input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
