package net.accelbyte.sdk.api.lobby.wrappers;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operations.player.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Player {

    private AccelByteSDK sdk;

    public Player(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsGetLobbyCcuResponse adminGetLobbyCCU(AdminGetLobbyCCU input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetLobbyCCU()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetAllPlayerSessionAttributeResponse adminGetAllPlayerSessionAttribute(AdminGetAllPlayerSessionAttribute input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetAllPlayerSessionAttribute()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminSetPlayerSessionAttribute(AdminSetPlayerSessionAttribute input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminSetPlayerSessionAttribute()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetPlayerSessionAttributeResponse adminGetPlayerSessionAttribute(AdminGetPlayerSessionAttribute input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetPlayerSessionAttribute()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetAllPlayerBlockedUsersResponse adminGetPlayerBlockedPlayersV1(AdminGetPlayerBlockedPlayersV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetPlayerBlockedPlayersV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetAllPlayerBlockedByUsersResponse adminGetPlayerBlockedByPlayersV1(AdminGetPlayerBlockedByPlayersV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetPlayerBlockedByPlayersV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public Integer adminBulkBlockPlayersV1(AdminBulkBlockPlayersV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminBulkBlockPlayersV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetAllPlayerBlockedUsersResponse publicGetPlayerBlockedPlayersV1(PublicGetPlayerBlockedPlayersV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetPlayerBlockedPlayersV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetAllPlayerBlockedByUsersResponse publicGetPlayerBlockedByPlayersV1(PublicGetPlayerBlockedByPlayersV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetPlayerBlockedByPlayersV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
