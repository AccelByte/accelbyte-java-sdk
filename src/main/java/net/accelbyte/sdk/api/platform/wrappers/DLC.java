package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.dlc.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class DLC {

    private AccelByteSDK sdk;

    public DLC(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public DLCItemConfigInfo getDLCItemConfig(GetDLCItemConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public DLCItemConfigInfo updateDLCItemConfig(UpdateDLCItemConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteDLCItemConfig(DeleteDLCItemConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            input
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PlatformDLCConfigInfo getPlatformDLCConfig(GetPlatformDLCConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PlatformDLCConfigInfo updatePlatformDLCConfig(UpdatePlatformDLCConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deletePlatformDLCConfig(DeletePlatformDLCConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            input
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicSyncPsnDlcInventory(PublicSyncPsnDlcInventory input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            input
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void syncSteamDLC(SyncSteamDLC input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            input
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void syncXboxDLC(SyncXboxDLC input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            input
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}