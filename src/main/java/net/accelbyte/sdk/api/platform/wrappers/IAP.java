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
import net.accelbyte.sdk.api.platform.operations.iap.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class IAP {

  private AccelByteSDK sdk;

  public IAP(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetAppleIAPConfig
   */
  public AppleIAPConfigInfo getAppleIAPConfig(GetAppleIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateAppleIAPConfig
   */
  public AppleIAPConfigInfo updateAppleIAPConfig(UpdateAppleIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteAppleIAPConfig
   */
  public void deleteAppleIAPConfig(DeleteAppleIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetEpicGamesIAPConfig
   */
  public EpicGamesIAPConfigInfo getEpicGamesIAPConfig(GetEpicGamesIAPConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateEpicGamesIAPConfig
   */
  public EpicGamesIAPConfigInfo updateEpicGamesIAPConfig(UpdateEpicGamesIAPConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteEpicGamesIAPConfig
   */
  public void deleteEpicGamesIAPConfig(DeleteEpicGamesIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGoogleIAPConfig
   */
  public GoogleIAPConfigInfo getGoogleIAPConfig(GetGoogleIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateGoogleIAPConfig
   */
  public GoogleIAPConfigInfo updateGoogleIAPConfig(UpdateGoogleIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteGoogleIAPConfig
   */
  public void deleteGoogleIAPConfig(DeleteGoogleIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateGoogleP12File
   */
  public GoogleIAPConfigInfo updateGoogleP12File(UpdateGoogleP12File input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetIAPItemConfig
   */
  public IAPItemConfigInfo getIAPItemConfig(GetIAPItemConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateIAPItemConfig
   */
  public IAPItemConfigInfo updateIAPItemConfig(UpdateIAPItemConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteIAPItemConfig
   */
  public void deleteIAPItemConfig(DeleteIAPItemConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPlayStationIAPConfig
   */
  public PlayStationIAPConfigInfo getPlayStationIAPConfig(GetPlayStationIAPConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdatePlaystationIAPConfig
   */
  public PlayStationIAPConfigInfo updatePlaystationIAPConfig(UpdatePlaystationIAPConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeletePlaystationIAPConfig
   */
  public void deletePlaystationIAPConfig(DeletePlaystationIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSteamIAPConfig
   */
  public SteamIAPConfig getSteamIAPConfig(GetSteamIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateSteamIAPConfig
   */
  public SteamIAPConfigInfo updateSteamIAPConfig(UpdateSteamIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteSteamIAPConfig
   */
  public void deleteSteamIAPConfig(DeleteSteamIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetTwitchIAPConfig
   */
  public TwitchIAPConfigInfo getTwitchIAPConfig(GetTwitchIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateTwitchIAPConfig
   */
  public TwitchIAPConfigInfo updateTwitchIAPConfig(UpdateTwitchIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteTwitchIAPConfig
   */
  public void deleteTwitchIAPConfig(DeleteTwitchIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetXblIAPConfig
   */
  public XblIAPConfigInfo getXblIAPConfig(GetXblIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateXblIAPConfig
   */
  public XblIAPConfigInfo updateXblIAPConfig(UpdateXblIAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteXblAPConfig
   */
  public void deleteXblAPConfig(DeleteXblAPConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateXblBPCertFile
   */
  public XblIAPConfigInfo updateXblBPCertFile(UpdateXblBPCertFile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryUserIAPOrders
   */
  public IAPOrderPagingSlicedResult queryUserIAPOrders(QueryUserIAPOrders input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryAllUserIAPOrders
   */
  public IAPOrderPagingSlicedResult queryAllUserIAPOrders(QueryAllUserIAPOrders input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryUserIAPConsumeHistory
   */
  public IAPConsumeHistoryPagingSlicedResult queryUserIAPConsumeHistory(
      QueryUserIAPConsumeHistory input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see MockFulfillIAPItem
   */
  public void mockFulfillIAPItem(MockFulfillIAPItem input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetIAPItemMapping
   */
  public IAPItemMappingInfo getIAPItemMapping(GetIAPItemMapping input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SyncTwitchDropsEntitlement
   */
  public List<TwitchSyncResult> syncTwitchDropsEntitlement(SyncTwitchDropsEntitlement input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicFulfillAppleIAPItem
   */
  public void publicFulfillAppleIAPItem(PublicFulfillAppleIAPItem input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SyncEpicGamesInventory
   */
  public List<EpicGamesReconcileResult> syncEpicGamesInventory(SyncEpicGamesInventory input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicFulfillGoogleIAPItem
   */
  public GoogleReceiptResolveResult publicFulfillGoogleIAPItem(PublicFulfillGoogleIAPItem input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicReconcilePlayStationStore
   */
  public List<PlayStationReconcileResult> publicReconcilePlayStationStore(
      PublicReconcilePlayStationStore input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicReconcilePlayStationStoreWithMultipleServiceLabels
   */
  public List<PlayStationReconcileResult> publicReconcilePlayStationStoreWithMultipleServiceLabels(
      PublicReconcilePlayStationStoreWithMultipleServiceLabels input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SyncSteamInventory
   */
  public void syncSteamInventory(SyncSteamInventory input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SyncTwitchDropsEntitlement1
   */
  public void syncTwitchDropsEntitlement1(SyncTwitchDropsEntitlement1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SyncXboxInventory
   */
  public List<XblReconcileResult> syncXboxInventory(SyncXboxInventory input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
