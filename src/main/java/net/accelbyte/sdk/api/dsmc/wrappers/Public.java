package net.accelbyte.sdk.api.dsmc.wrappers;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.operations.public_.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Public {

    private AccelByteSDK sdk;

    public Public(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsDefaultProvider getDefaultProvider(GetDefaultProvider input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetDefaultProvider()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<String> listProviders(ListProviders input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ListProviders()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsDefaultProvider listProvidersByRegion(ListProvidersByRegion input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ListProvidersByRegion()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}