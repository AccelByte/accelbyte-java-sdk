package net.accelbyte.sdk.api.qosm.wrappers;

import net.accelbyte.sdk.api.qosm.models.*;
import net.accelbyte.sdk.api.qosm.operations.server.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Server {

    private AccelByteSDK sdk;

    public Server(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public void heartbeat(Heartbeat input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new Heartbeat()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
