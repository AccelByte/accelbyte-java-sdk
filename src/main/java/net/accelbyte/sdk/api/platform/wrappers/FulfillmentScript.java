package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.fulfillment_script.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class FulfillmentScript {

    private AccelByteSDK sdk;

    public FulfillmentScript(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public List<FulfillmentScriptInfo> listFulfillmentScripts(ListFulfillmentScripts input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ListFulfillmentScripts()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FulfillmentScriptEvalTestResult testFulfillmentScriptEval(TestFulfillmentScriptEval input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TestFulfillmentScriptEval()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FulfillmentScriptInfo getFulfillmentScript(GetFulfillmentScript input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetFulfillmentScript()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FulfillmentScriptInfo createFulfillmentScript(CreateFulfillmentScript input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateFulfillmentScript()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteFulfillmentScript(DeleteFulfillmentScript input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteFulfillmentScript()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FulfillmentScriptInfo updateFulfillmentScript(UpdateFulfillmentScript input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateFulfillmentScript()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
