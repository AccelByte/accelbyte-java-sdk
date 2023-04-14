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
import net.accelbyte.sdk.api.platform.operations.wallet.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Wallet {

  private AccelByteSDK sdk;

  public Wallet(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetPlatformWalletConfig
   */
  public PlatformWalletConfigInfo getPlatformWalletConfig(GetPlatformWalletConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdatePlatformWalletConfig
   */
  public PlatformWalletConfigInfo updatePlatformWalletConfig(UpdatePlatformWalletConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ResetPlatformWalletConfig
   */
  public PlatformWalletConfigInfo resetPlatformWalletConfig(ResetPlatformWalletConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryUserCurrencyWallets
   */
  public List<CurrencyWallet> queryUserCurrencyWallets(QueryUserCurrencyWallets input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DebitUserWalletByCurrencyCode
   */
  public WalletInfo debitUserWalletByCurrencyCode(DebitUserWalletByCurrencyCode input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListUserCurrencyTransactions
   */
  public WalletTransactionPagingSlicedResult listUserCurrencyTransactions(
      ListUserCurrencyTransactions input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CheckWallet
   * @deprecated
   */
  @Deprecated
  public void checkWallet(CheckWallet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreditUserWallet
   */
  public WalletInfo creditUserWallet(CreditUserWallet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PayWithUserWallet
   */
  public PlatformWallet payWithUserWallet(PayWithUserWallet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserWallet
   * @deprecated
   */
  @Deprecated
  public WalletInfo getUserWallet(GetUserWallet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DebitUserWallet
   * @deprecated
   */
  @Deprecated
  public WalletInfo debitUserWallet(DebitUserWallet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DisableUserWallet
   * @deprecated
   */
  @Deprecated
  public void disableUserWallet(DisableUserWallet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see EnableUserWallet
   * @deprecated
   */
  @Deprecated
  public void enableUserWallet(EnableUserWallet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListUserWalletTransactions
   * @deprecated
   */
  @Deprecated
  public DetailedWalletTransactionPagingSlicedResult listUserWalletTransactions(
      ListUserWalletTransactions input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryWallets
   * @deprecated
   */
  @Deprecated
  public WalletPagingSlicedResult queryWallets(QueryWallets input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkCredit
   */
  public BulkCreditResult bulkCredit(BulkCredit input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkDebit
   */
  public BulkDebitResult bulkDebit(BulkDebit input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetWallet
   * @deprecated
   */
  @Deprecated
  public WalletInfo getWallet(GetWallet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyWallet
   */
  public PlatformWallet publicGetMyWallet(PublicGetMyWallet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetWallet
   */
  public PlatformWallet publicGetWallet(PublicGetWallet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicListUserWalletTransactions
   */
  public WalletTransactionPagingSlicedResult publicListUserWalletTransactions(
      PublicListUserWalletTransactions input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
