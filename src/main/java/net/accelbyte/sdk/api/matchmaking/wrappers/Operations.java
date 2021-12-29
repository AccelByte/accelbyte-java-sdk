package net.accelbyte.sdk.api.matchmaking.wrappers;

import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.operations.operations.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Operations {

    private AccelByteSDK sdk;

    public Operations(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public void getHealthcheckInfo(GetHealthcheckInfo input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new GetHealthcheckInfo()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void handlerV3Healthz(HandlerV3Healthz input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new HandlerV3Healthz()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<LogAppMessageDeclaration> publicGetMessages(PublicGetMessages input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetMessages()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void versionCheckHandler(VersionCheckHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new VersionCheckHandler()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
