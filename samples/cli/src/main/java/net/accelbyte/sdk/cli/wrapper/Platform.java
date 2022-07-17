/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.platform.achievement_platform.*;
import net.accelbyte.sdk.cli.api.platform.anonymization.*;
import net.accelbyte.sdk.cli.api.platform.campaign.*;
import net.accelbyte.sdk.cli.api.platform.catalog_changes.*;
import net.accelbyte.sdk.cli.api.platform.category.*;
import net.accelbyte.sdk.cli.api.platform.currency.*;
import net.accelbyte.sdk.cli.api.platform.dlc.*;
import net.accelbyte.sdk.cli.api.platform.entitlement.*;
import net.accelbyte.sdk.cli.api.platform.fulfillment.*;
import net.accelbyte.sdk.cli.api.platform.fulfillment_script.*;
import net.accelbyte.sdk.cli.api.platform.iap.*;
import net.accelbyte.sdk.cli.api.platform.item.*;
import net.accelbyte.sdk.cli.api.platform.key_group.*;
import net.accelbyte.sdk.cli.api.platform.order.*;
import net.accelbyte.sdk.cli.api.platform.order_dedicated.*;
import net.accelbyte.sdk.cli.api.platform.payment.*;
import net.accelbyte.sdk.cli.api.platform.payment_account.*;
import net.accelbyte.sdk.cli.api.platform.payment_callback_config.*;
import net.accelbyte.sdk.cli.api.platform.payment_config.*;
import net.accelbyte.sdk.cli.api.platform.payment_dedicated.*;
import net.accelbyte.sdk.cli.api.platform.payment_station.*;
import net.accelbyte.sdk.cli.api.platform.reward.*;
import net.accelbyte.sdk.cli.api.platform.store.*;
import net.accelbyte.sdk.cli.api.platform.subscription.*;
import net.accelbyte.sdk.cli.api.platform.ticket.*;
import net.accelbyte.sdk.cli.api.platform.wallet.*;
import picocli.CommandLine.Command;

@Command(
    name = "platform",
    mixinStandardHelpOptions = true,
    subcommands = {
      ListFulfillmentScripts.class,
      TestFulfillmentScriptEval.class,
      GetFulfillmentScript.class,
      CreateFulfillmentScript.class,
      DeleteFulfillmentScript.class,
      UpdateFulfillmentScript.class,
      QueryCampaigns.class,
      CreateCampaign.class,
      GetCampaign.class,
      UpdateCampaign.class,
      GetCampaignDynamic.class,
      GetRootCategories.class,
      CreateCategory.class,
      ListCategoriesBasic.class,
      GetCategory.class,
      UpdateCategory.class,
      DeleteCategory.class,
      GetChildCategories.class,
      GetDescendantCategories.class,
      QueryCodes.class,
      CreateCodes.class,
      Download.class,
      BulkDisableCodes.class,
      BulkEnableCodes.class,
      QueryRedeemHistory.class,
      GetCode.class,
      DisableCode.class,
      EnableCode.class,
      ListCurrencies.class,
      CreateCurrency.class,
      UpdateCurrency.class,
      DeleteCurrency.class,
      GetCurrencyConfig.class,
      GetCurrencySummary.class,
      GetDLCItemConfig.class,
      UpdateDLCItemConfig.class,
      DeleteDLCItemConfig.class,
      GetPlatformDLCConfig.class,
      UpdatePlatformDLCConfig.class,
      DeletePlatformDLCConfig.class,
      QueryEntitlements.class,
      GetEntitlement.class,
      QueryFulfillmentHistories.class,
      GetAppleIAPConfig.class,
      UpdateAppleIAPConfig.class,
      DeleteAppleIAPConfig.class,
      GetEpicGamesIAPConfig.class,
      UpdateEpicGamesIAPConfig.class,
      DeleteEpicGamesIAPConfig.class,
      GetGoogleIAPConfig.class,
      UpdateGoogleIAPConfig.class,
      DeleteGoogleIAPConfig.class,
      UpdateGoogleP12File.class,
      GetIAPItemConfig.class,
      UpdateIAPItemConfig.class,
      DeleteIAPItemConfig.class,
      GetPlayStationIAPConfig.class,
      UpdatePlaystationIAPConfig.class,
      DeletePlaystationIAPConfig.class,
      GetStadiaIAPConfig.class,
      DeleteStadiaIAPConfig.class,
      UpdateStadiaJsonConfigFile.class,
      GetSteamIAPConfig.class,
      UpdateSteamIAPConfig.class,
      DeleteSteamIAPConfig.class,
      GetTwitchIAPConfig.class,
      UpdateTwitchIAPConfig.class,
      DeleteTwitchIAPConfig.class,
      GetXblIAPConfig.class,
      UpdateXblIAPConfig.class,
      DeleteXblAPConfig.class,
      UpdateXblBPCertFile.class,
      SyncInGameItem.class,
      CreateItem.class,
      GetItemByAppId.class,
      QueryItems.class,
      ListBasicItemsByFeatures.class,
      GetItemBySku.class,
      GetLocaleItemBySku.class,
      GetItemIdBySku.class,
      GetBulkItemIdBySkus.class,
      BulkGetLocaleItems.class,
      SearchItems.class,
      QueryUncategorizedItems.class,
      GetItem.class,
      UpdateItem.class,
      DeleteItem.class,
      AcquireItem.class,
      GetApp.class,
      UpdateApp.class,
      DisableItem.class,
      GetItemDynamicData.class,
      EnableItem.class,
      FeatureItem.class,
      DefeatureItem.class,
      GetLocaleItem.class,
      ReturnItem.class,
      QueryKeyGroups.class,
      CreateKeyGroup.class,
      GetKeyGroup.class,
      UpdateKeyGroup.class,
      GetKeyGroupDynamic.class,
      ListKeys.class,
      UploadKeys.class,
      QueryOrders.class,
      GetOrderStatistics.class,
      GetOrder.class,
      RefundOrder.class,
      GetPaymentCallbackConfig.class,
      UpdatePaymentCallbackConfig.class,
      QueryPaymentNotifications.class,
      QueryPaymentOrders.class,
      CreatePaymentOrderByDedicated.class,
      ListExtOrderNoByExtTxId.class,
      GetPaymentOrder.class,
      ChargePaymentOrder.class,
      RefundPaymentOrderByDedicated.class,
      SimulatePaymentOrderNotification.class,
      GetPaymentOrderChargeStatus.class,
      GetPlatformWalletConfig.class,
      UpdatePlatformWalletConfig.class,
      ResetPlatformWalletConfig.class,
      CreateReward.class,
      QueryRewards.class,
      ExportRewards.class,
      ImportRewards.class,
      GetReward.class,
      UpdateReward.class,
      DeleteReward.class,
      CheckEventCondition.class,
      ListStores.class,
      CreateStore.class,
      ImportStore.class,
      GetPublishedStore.class,
      DeletePublishedStore.class,
      GetPublishedStoreBackup.class,
      RollbackPublishedStore.class,
      GetStore.class,
      UpdateStore.class,
      DeleteStore.class,
      QueryChanges.class,
      PublishAll.class,
      PublishSelected.class,
      SelectAllRecords.class,
      GetStatistic.class,
      UnselectAllRecords.class,
      SelectRecord.class,
      UnselectRecord.class,
      CloneStore.class,
      ExportStore.class,
      QuerySubscriptions.class,
      RecurringChargeSubscription.class,
      GetTicketDynamic.class,
      DecreaseTicketSale.class,
      GetTicketBoothID.class,
      IncreaseTicketSale.class,
      UnlockSteamUserAchievement.class,
      GetXblUserAchievements.class,
      UpdateXblUserAchievement.class,
      AnonymizeCampaign.class,
      AnonymizeEntitlement.class,
      AnonymizeFulfillment.class,
      AnonymizeIntegration.class,
      AnonymizeOrder.class,
      AnonymizePayment.class,
      AnonymizeSubscription.class,
      AnonymizeWallet.class,
      QueryUserEntitlements.class,
      GrantUserEntitlement.class,
      GetUserAppEntitlementByAppId.class,
      QueryUserEntitlementsByAppType.class,
      GetUserEntitlementByItemId.class,
      GetUserEntitlementBySku.class,
      ExistsAnyUserActiveEntitlement.class,
      ExistsAnyUserActiveEntitlementByItemIds.class,
      GetUserAppEntitlementOwnershipByAppId.class,
      GetUserEntitlementOwnershipByItemId.class,
      GetUserEntitlementOwnershipBySku.class,
      RevokeUserEntitlements.class,
      GetUserEntitlement.class,
      UpdateUserEntitlement.class,
      ConsumeUserEntitlement.class,
      DisableUserEntitlement.class,
      EnableUserEntitlement.class,
      GetUserEntitlementHistories.class,
      RevokeUserEntitlement.class,
      FulfillItem.class,
      RedeemCode.class,
      FulfillRewards.class,
      QueryUserIAPOrders.class,
      QueryAllUserIAPOrders.class,
      MockFulfillIAPItem.class,
      QueryUserOrders.class,
      AdminCreateUserOrder.class,
      CountOfPurchasedItem.class,
      GetUserOrder.class,
      UpdateUserOrderStatus.class,
      FulfillUserOrder.class,
      GetUserOrderGrant.class,
      GetUserOrderHistories.class,
      ProcessUserOrderNotification.class,
      DownloadUserOrderReceipt.class,
      CreateUserPaymentOrder.class,
      RefundUserPaymentOrder.class,
      ApplyUserRedemption.class,
      QueryUserSubscriptions.class,
      GetUserSubscriptionActivities.class,
      PlatformSubscribeSubscription.class,
      CheckUserSubscriptionSubscribableByItemId.class,
      GetUserSubscription.class,
      DeleteUserSubscription.class,
      CancelSubscription.class,
      GrantDaysToSubscription.class,
      GetUserSubscriptionBillingHistories.class,
      ProcessUserSubscriptionNotification.class,
      AcquireUserTicket.class,
      QueryUserCurrencyWallets.class,
      ListUserCurrencyTransactions.class,
      CheckWallet.class,
      CreditUserWallet.class,
      PayWithUserWallet.class,
      GetUserWallet.class,
      DebitUserWallet.class,
      DisableUserWallet.class,
      EnableUserWallet.class,
      ListUserWalletTransactions.class,
      QueryWallets.class,
      GetWallet.class,
      SyncOrders.class,
      TestAdyenConfig.class,
      TestAliPayConfig.class,
      TestCheckoutConfig.class,
      DebugMatchedPaymentMerchantConfig.class,
      TestPayPalConfig.class,
      TestStripeConfig.class,
      TestWxPayConfig.class,
      TestXsollaConfig.class,
      GetPaymentMerchantConfig.class,
      UpdateAdyenConfig.class,
      TestAdyenConfigById.class,
      UpdateAliPayConfig.class,
      TestAliPayConfigById.class,
      UpdateCheckoutConfig.class,
      TestCheckoutConfigById.class,
      UpdatePayPalConfig.class,
      TestPayPalConfigById.class,
      UpdateStripeConfig.class,
      TestStripeConfigById.class,
      UpdateWxPayConfig.class,
      UpdateWxPayConfigCert.class,
      TestWxPayConfigById.class,
      UpdateXsollaConfig.class,
      TestXsollaConfigById.class,
      UpdateXsollaUIConfig.class,
      QueryPaymentProviderConfig.class,
      CreatePaymentProviderConfig.class,
      GetAggregatePaymentProviders.class,
      DebugMatchedPaymentProviderConfig.class,
      GetSpecialPaymentProviders.class,
      UpdatePaymentProviderConfig.class,
      DeletePaymentProviderConfig.class,
      GetPaymentTaxConfig.class,
      UpdatePaymentTaxConfig.class,
      SyncPaymentOrders.class,
      PublicGetRootCategories.class,
      DownloadCategories.class,
      PublicGetCategory.class,
      PublicGetChildCategories.class,
      PublicGetDescendantCategories.class,
      PublicListCurrencies.class,
      PublicGetItemByAppId.class,
      PublicQueryItems.class,
      PublicGetItemBySku.class,
      PublicBulkGetItems.class,
      PublicSearchItems.class,
      PublicGetApp.class,
      PublicGetItemDynamicData.class,
      PublicGetItem.class,
      GetPaymentCustomization.class,
      PublicGetPaymentUrl.class,
      PublicGetPaymentMethods.class,
      PublicGetUnpaidPaymentOrder.class,
      Pay.class,
      PublicCheckPaymentOrderPaidStatus.class,
      GetPaymentPublicConfig.class,
      PublicGetQRCode.class,
      PublicNormalizePaymentReturnUrl.class,
      GetPaymentTaxValue.class,
      GetRewardByCode.class,
      QueryRewards1.class,
      GetReward1.class,
      PublicListStores.class,
      PublicExistsAnyMyActiveEntitlement.class,
      PublicGetMyAppEntitlementOwnershipByAppId.class,
      PublicGetMyEntitlementOwnershipByItemId.class,
      PublicGetMyEntitlementOwnershipBySku.class,
      PublicGetEntitlementOwnershipToken.class,
      PublicGetMyWallet.class,
      SyncEpicGameDLC.class,
      PublicSyncPsnDlcInventory.class,
      SyncSteamDLC.class,
      SyncXboxDLC.class,
      PublicQueryUserEntitlements.class,
      PublicGetUserAppEntitlementByAppId.class,
      PublicQueryUserEntitlementsByAppType.class,
      PublicGetUserEntitlementByItemId.class,
      PublicGetUserEntitlementBySku.class,
      PublicExistsAnyUserActiveEntitlement.class,
      PublicGetUserAppEntitlementOwnershipByAppId.class,
      PublicGetUserEntitlementOwnershipByItemId.class,
      PublicGetUserEntitlementOwnershipBySku.class,
      PublicGetUserEntitlement.class,
      PublicConsumeUserEntitlement.class,
      PublicRedeemCode.class,
      PublicFulfillAppleIAPItem.class,
      SyncEpicGamesInventory.class,
      PublicFulfillGoogleIAPItem.class,
      PublicReconcilePlayStationStore.class,
      SyncStadiaEntitlement.class,
      SyncSteamInventory.class,
      SyncTwitchDropsEntitlement.class,
      SyncXboxInventory.class,
      PublicQueryUserOrders.class,
      PublicCreateUserOrder.class,
      PublicGetUserOrder.class,
      PublicCancelUserOrder.class,
      PublicGetUserOrderHistories.class,
      PublicDownloadUserOrderReceipt.class,
      PublicGetPaymentAccounts.class,
      PublicDeletePaymentAccount.class,
      PublicQueryUserSubscriptions.class,
      PublicSubscribeSubscription.class,
      PublicCheckUserSubscriptionSubscribableByItemId.class,
      PublicGetUserSubscription.class,
      PublicChangeSubscriptionBillingAccount.class,
      PublicCancelSubscription.class,
      PublicGetUserSubscriptionBillingHistories.class,
      PublicGetWallet.class,
      PublicListUserWalletTransactions.class,
    })
public class Platform implements Runnable {

  @Override
  public void run() {}
}
