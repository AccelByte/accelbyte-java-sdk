package net.accelbyte.sdk.api.dsmc.wrappers;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.operations.admin.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Admin {

    private AccelByteSDK sdk;

    public Admin(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsListServerResponse listServer(ListServer input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ListServer()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCountServerResponse countServer(CountServer input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CountServer()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsDetailedCountServerResponse countServerDetailed(CountServerDetailed input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CountServerDetailed()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsListServerResponse listLocalServer(ListLocalServer input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ListLocalServer()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteLocalServer(DeleteLocalServer input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteLocalServer()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsServer getServer(GetServer input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetServer()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteServer(DeleteServer input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteServer()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsServerLogs getServerLogs(GetServerLogs input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetServerLogs()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsListSessionResponse listSession(ListSession input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ListSession()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCountSessionResponse countSession(CountSession input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CountSession()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteSession(DeleteSession input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteSession()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
