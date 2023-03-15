/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.entitlement.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Entitlement {

  private AccelByteSDK sdk;

  public Entitlement(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see QueryEntitlements
   */
  public EntitlementPagingSlicedResult queryEntitlements(QueryEntitlements input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetEntitlement
   */
  public EntitlementInfo getEntitlement(GetEntitlement input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryUserEntitlements
   */
  public EntitlementPagingSlicedResult queryUserEntitlements(QueryUserEntitlements input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GrantUserEntitlement
   */
  public List<StackableEntitlementInfo> grantUserEntitlement(GrantUserEntitlement input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserAppEntitlementByAppId
   */
  public AppEntitlementInfo getUserAppEntitlementByAppId(GetUserAppEntitlementByAppId input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryUserEntitlementsByAppType
   */
  public AppEntitlementPagingSlicedResult queryUserEntitlementsByAppType(
      QueryUserEntitlementsByAppType input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEntitlementByItemId
   */
  public EntitlementInfo getUserEntitlementByItemId(GetUserEntitlementByItemId input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserActiveEntitlementsByItemIds
   */
  public List<EntitlementInfo> getUserActiveEntitlementsByItemIds(
      GetUserActiveEntitlementsByItemIds input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEntitlementBySku
   */
  public EntitlementInfo getUserEntitlementBySku(GetUserEntitlementBySku input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ExistsAnyUserActiveEntitlement
   */
  public Ownership existsAnyUserActiveEntitlement(ExistsAnyUserActiveEntitlement input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ExistsAnyUserActiveEntitlementByItemIds
   */
  public Ownership existsAnyUserActiveEntitlementByItemIds(
      ExistsAnyUserActiveEntitlementByItemIds input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserAppEntitlementOwnershipByAppId
   */
  public Ownership getUserAppEntitlementOwnershipByAppId(
      GetUserAppEntitlementOwnershipByAppId input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEntitlementOwnershipByItemId
   */
  public TimedOwnership getUserEntitlementOwnershipByItemId(
      GetUserEntitlementOwnershipByItemId input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEntitlementOwnershipByItemIds
   */
  public List<EntitlementOwnership> getUserEntitlementOwnershipByItemIds(
      GetUserEntitlementOwnershipByItemIds input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEntitlementOwnershipBySku
   */
  public TimedOwnership getUserEntitlementOwnershipBySku(GetUserEntitlementOwnershipBySku input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RevokeUserEntitlements
   */
  public BulkOperationResult revokeUserEntitlements(RevokeUserEntitlements input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEntitlement
   */
  public EntitlementInfo getUserEntitlement(GetUserEntitlement input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateUserEntitlement
   */
  public EntitlementInfo updateUserEntitlement(UpdateUserEntitlement input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ConsumeUserEntitlement
   */
  public EntitlementDecrementResult consumeUserEntitlement(ConsumeUserEntitlement input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DisableUserEntitlement
   */
  public EntitlementInfo disableUserEntitlement(DisableUserEntitlement input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see EnableUserEntitlement
   */
  public EntitlementInfo enableUserEntitlement(EnableUserEntitlement input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEntitlementHistories
   */
  public List<EntitlementHistoryInfo> getUserEntitlementHistories(GetUserEntitlementHistories input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RevokeUserEntitlement
   */
  public EntitlementInfo revokeUserEntitlement(RevokeUserEntitlement input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SellUserEntitlement
   */
  public EntitlementSoldResult sellUserEntitlement(SellUserEntitlement input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicExistsAnyMyActiveEntitlement
   */
  public Ownership publicExistsAnyMyActiveEntitlement(PublicExistsAnyMyActiveEntitlement input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyAppEntitlementOwnershipByAppId
   */
  public Ownership publicGetMyAppEntitlementOwnershipByAppId(
      PublicGetMyAppEntitlementOwnershipByAppId input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyEntitlementOwnershipByItemId
   */
  public TimedOwnership publicGetMyEntitlementOwnershipByItemId(
      PublicGetMyEntitlementOwnershipByItemId input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyEntitlementOwnershipBySku
   */
  public TimedOwnership publicGetMyEntitlementOwnershipBySku(
      PublicGetMyEntitlementOwnershipBySku input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetEntitlementOwnershipToken
   */
  public OwnershipToken publicGetEntitlementOwnershipToken(PublicGetEntitlementOwnershipToken input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicQueryUserEntitlements
   */
  public EntitlementPagingSlicedResult publicQueryUserEntitlements(
      PublicQueryUserEntitlements input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserAppEntitlementByAppId
   */
  public AppEntitlementInfo publicGetUserAppEntitlementByAppId(
      PublicGetUserAppEntitlementByAppId input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicQueryUserEntitlementsByAppType
   */
  public AppEntitlementPagingSlicedResult publicQueryUserEntitlementsByAppType(
      PublicQueryUserEntitlementsByAppType input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserEntitlementByItemId
   */
  public EntitlementInfo publicGetUserEntitlementByItemId(PublicGetUserEntitlementByItemId input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserEntitlementBySku
   */
  public EntitlementInfo publicGetUserEntitlementBySku(PublicGetUserEntitlementBySku input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicExistsAnyUserActiveEntitlement
   */
  public Ownership publicExistsAnyUserActiveEntitlement(PublicExistsAnyUserActiveEntitlement input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserAppEntitlementOwnershipByAppId
   */
  public Ownership publicGetUserAppEntitlementOwnershipByAppId(
      PublicGetUserAppEntitlementOwnershipByAppId input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserEntitlementOwnershipByItemId
   */
  public TimedOwnership publicGetUserEntitlementOwnershipByItemId(
      PublicGetUserEntitlementOwnershipByItemId input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserEntitlementOwnershipByItemIds
   */
  public List<EntitlementOwnership> publicGetUserEntitlementOwnershipByItemIds(
      PublicGetUserEntitlementOwnershipByItemIds input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserEntitlementOwnershipBySku
   */
  public TimedOwnership publicGetUserEntitlementOwnershipBySku(
      PublicGetUserEntitlementOwnershipBySku input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserEntitlement
   */
  public EntitlementInfo publicGetUserEntitlement(PublicGetUserEntitlement input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicConsumeUserEntitlement
   */
  public EntitlementDecrementResult publicConsumeUserEntitlement(PublicConsumeUserEntitlement input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicSellUserEntitlement
   */
  public EntitlementSoldResult publicSellUserEntitlement(PublicSellUserEntitlement input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
