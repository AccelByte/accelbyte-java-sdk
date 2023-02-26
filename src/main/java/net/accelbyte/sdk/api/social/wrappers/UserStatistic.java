/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.operations.user_statistic.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class UserStatistic {

  private AccelByteSDK sdk;

  public UserStatistic(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see BulkFetchStatItems
   */
  public List<UserStatItemInfo> bulkFetchStatItems(BulkFetchStatItems input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkIncUserStatItem
   */
  public List<BulkStatOperationResult> bulkIncUserStatItem(BulkIncUserStatItem input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkIncUserStatItemValue
   */
  public List<BulkStatOperationResult> bulkIncUserStatItemValue(BulkIncUserStatItemValue input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkFetchOrDefaultStatItems
   */
  public List<ADTOObjectForUserStatItemValue> bulkFetchOrDefaultStatItems(
      BulkFetchOrDefaultStatItems input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkResetUserStatItem
   */
  public List<BulkStatOperationResult> bulkResetUserStatItem(BulkResetUserStatItem input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserStatItems
   */
  public UserStatItemPagingSlicedResult getUserStatItems(GetUserStatItems input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkCreateUserStatItems
   */
  public List<BulkStatOperationResult> bulkCreateUserStatItems(BulkCreateUserStatItems input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkIncUserStatItem1
   */
  public List<BulkStatOperationResult> bulkIncUserStatItem1(BulkIncUserStatItem1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkIncUserStatItemValue1
   */
  public List<BulkStatOperationResult> bulkIncUserStatItemValue1(BulkIncUserStatItemValue1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkResetUserStatItem1
   */
  public List<BulkStatOperationResult> bulkResetUserStatItem1(BulkResetUserStatItem1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateUserStatItem
   */
  public void createUserStatItem(CreateUserStatItem input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserStatItems
   */
  public void deleteUserStatItems(DeleteUserStatItems input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see IncUserStatItemValue
   */
  public StatItemIncResult incUserStatItemValue(IncUserStatItemValue input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ResetUserStatItemValue
   */
  public StatItemIncResult resetUserStatItemValue(ResetUserStatItemValue input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkFetchStatItems1
   */
  public List<UserStatItemInfo> bulkFetchStatItems1(BulkFetchStatItems1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicBulkIncUserStatItem
   */
  public List<BulkStatOperationResult> publicBulkIncUserStatItem(PublicBulkIncUserStatItem input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicBulkIncUserStatItemValue
   */
  public List<BulkStatOperationResult> publicBulkIncUserStatItemValue(
      PublicBulkIncUserStatItemValue input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkResetUserStatItem2
   */
  public List<BulkStatOperationResult> bulkResetUserStatItem2(BulkResetUserStatItem2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicQueryUserStatItems
   */
  public UserStatItemPagingSlicedResult publicQueryUserStatItems(PublicQueryUserStatItems input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicBulkCreateUserStatItems
   */
  public List<BulkStatOperationResult> publicBulkCreateUserStatItems(
      PublicBulkCreateUserStatItems input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicQueryUserStatItems1
   */
  public List<ADTOObjectForUserStatItemValue> publicQueryUserStatItems1(
      PublicQueryUserStatItems1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicBulkIncUserStatItem1
   */
  public List<BulkStatOperationResult> publicBulkIncUserStatItem1(PublicBulkIncUserStatItem1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkIncUserStatItemValue2
   */
  public List<BulkStatOperationResult> bulkIncUserStatItemValue2(BulkIncUserStatItemValue2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkResetUserStatItem3
   */
  public List<BulkStatOperationResult> bulkResetUserStatItem3(BulkResetUserStatItem3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCreateUserStatItem
   */
  public void publicCreateUserStatItem(PublicCreateUserStatItem input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserStatItems1
   */
  public void deleteUserStatItems1(DeleteUserStatItems1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicIncUserStatItem
   */
  public StatItemIncResult publicIncUserStatItem(PublicIncUserStatItem input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicIncUserStatItemValue
   */
  public StatItemIncResult publicIncUserStatItemValue(PublicIncUserStatItemValue input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ResetUserStatItemValue1
   */
  public StatItemIncResult resetUserStatItemValue1(ResetUserStatItemValue1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkUpdateUserStatItemV2
   */
  public List<BulkStatOperationResult> bulkUpdateUserStatItemV2(BulkUpdateUserStatItemV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkFetchOrDefaultStatItems1
   */
  public List<ADTOObjectForUserStatItemValue> bulkFetchOrDefaultStatItems1(
      BulkFetchOrDefaultStatItems1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkUpdateUserStatItem
   */
  public List<BulkStatOperationResult> bulkUpdateUserStatItem(BulkUpdateUserStatItem input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkResetUserStatItemValues
   */
  public List<BulkStatOperationResult> bulkResetUserStatItemValues(
      BulkResetUserStatItemValues input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserStatItems2
   */
  public void deleteUserStatItems2(DeleteUserStatItems2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateUserStatItemValue
   */
  public StatItemIncResult updateUserStatItemValue(UpdateUserStatItemValue input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkUpdateUserStatItem1
   */
  public List<BulkStatOperationResult> bulkUpdateUserStatItem1(BulkUpdateUserStatItem1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicQueryUserStatItems2
   */
  public List<ADTOObjectForUserStatItemValue> publicQueryUserStatItems2(
      PublicQueryUserStatItems2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkUpdateUserStatItem2
   */
  public List<BulkStatOperationResult> bulkUpdateUserStatItem2(BulkUpdateUserStatItem2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateUserStatItemValue1
   */
  public StatItemIncResult updateUserStatItemValue1(UpdateUserStatItemValue1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
