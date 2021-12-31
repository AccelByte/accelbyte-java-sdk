package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.iap.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class IAP {

    private AccelByteSDK sdk;

    public IAP(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public AppleIAPConfigInfo getAppleIAPConfig(GetAppleIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetAppleIAPConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AppleIAPConfigInfo updateAppleIAPConfig(UpdateAppleIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateAppleIAPConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteAppleIAPConfig(DeleteAppleIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteAppleIAPConfig()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EpicGamesIAPConfigInfo getEpicGamesIAPConfig(GetEpicGamesIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetEpicGamesIAPConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EpicGamesIAPConfigInfo updateEpicGamesIAPConfig(UpdateEpicGamesIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateEpicGamesIAPConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteEpicGamesIAPConfig(DeleteEpicGamesIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteEpicGamesIAPConfig()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public GoogleIAPConfigInfo getGoogleIAPConfig(GetGoogleIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetGoogleIAPConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public GoogleIAPConfigInfo updateGoogleIAPConfig(UpdateGoogleIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateGoogleIAPConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteGoogleIAPConfig(DeleteGoogleIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteGoogleIAPConfig()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public GoogleIAPConfigInfo updateGoogleP12File(UpdateGoogleP12File input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateGoogleP12File()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PlayStationIAPConfigInfo getPlayStationIAPConfig(GetPlayStationIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetPlayStationIAPConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PlayStationIAPConfigInfo updatePlaystationIAPConfig(UpdatePlaystationIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdatePlaystationIAPConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deletePlaystationIAPConfig(DeletePlaystationIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeletePlaystationIAPConfig()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StadiaIAPConfigInfo getStadiaIAPConfig(GetStadiaIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetStadiaIAPConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteStadiaIAPConfig(DeleteStadiaIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteStadiaIAPConfig()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StadiaIAPConfigInfo updateStadiaJsonConfigFile(UpdateStadiaJsonConfigFile input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateStadiaJsonConfigFile()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SteamIAPConfig getSteamIAPConfig(GetSteamIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetSteamIAPConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SteamIAPConfigInfo updateSteamIAPConfig(UpdateSteamIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateSteamIAPConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteSteamIAPConfig(DeleteSteamIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteSteamIAPConfig()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public XblIAPConfigInfo getXblIAPConfig(GetXblIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetXblIAPConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public XblIAPConfigInfo updateXblIAPConfig(UpdateXblIAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateXblIAPConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteXblAPConfig(DeleteXblAPConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteXblAPConfig()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public XblIAPConfigInfo updateXblBPCertFile(UpdateXblBPCertFile input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateXblBPCertFile()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public IAPOrderPagingSlicedResult queryUserIAPOrders(QueryUserIAPOrders input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryUserIAPOrders()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void mockFulfillIAPItem(MockFulfillIAPItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new MockFulfillIAPItem()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicFulfillAppleIAPItem(PublicFulfillAppleIAPItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicFulfillAppleIAPItem()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<EpicGamesReconcileResult> syncEpicGamesInventory(SyncEpicGamesInventory input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SyncEpicGamesInventory()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicFulfillGoogleIAPItem(PublicFulfillGoogleIAPItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicFulfillGoogleIAPItem()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<PlayStationReconcileResult> publicReconcilePlayStationStore(PublicReconcilePlayStationStore input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicReconcilePlayStationStore()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void syncStadiaEntitlement(SyncStadiaEntitlement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SyncStadiaEntitlement()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void syncSteamInventory(SyncSteamInventory input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SyncSteamInventory()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<XblReconcileResult> syncXboxInventory(SyncXboxInventory input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SyncXboxInventory()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}