package net.accelbyte.sdk.api.dslogmanager.wrappers;

import net.accelbyte.sdk.api.dslogmanager.models.*;
import net.accelbyte.sdk.api.dslogmanager.operations.terminated_servers.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class TerminatedServers {

    private AccelByteSDK sdk;

    public TerminatedServers(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsListTerminatedServersResponse listTerminatedServers(ListTerminatedServers input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ListTerminatedServers()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void downloadServerLogs(DownloadServerLogs input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DownloadServerLogs()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsLogFileStatus checkServerLogs(CheckServerLogs input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CheckServerLogs()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
