package net.accelbyte.sdk.api.dslogmanager.wrappers;

import net.accelbyte.sdk.api.dslogmanager.models.*;
import net.accelbyte.sdk.api.dslogmanager.operations.all_terminated_servers.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class AllTerminatedServers {

    private AccelByteSDK sdk;

    public AllTerminatedServers(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public void batchDownloadServerLogs(BatchDownloadServerLogs input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new BatchDownloadServerLogs()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsListTerminatedServersResponse listAllTerminatedServers(ListAllTerminatedServers input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ListAllTerminatedServers()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
