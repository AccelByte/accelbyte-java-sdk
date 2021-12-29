package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operations.concurrent_record.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class ConcurrentRecord {

    private AccelByteSDK sdk;

    public ConcurrentRecord(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public void putGameRecordConcurrentHandlerV1(PutGameRecordConcurrentHandlerV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PutGameRecordConcurrentHandlerV1()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void putPlayerPublicRecordConcurrentHandlerV1(PutPlayerPublicRecordConcurrentHandlerV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PutPlayerPublicRecordConcurrentHandlerV1()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
