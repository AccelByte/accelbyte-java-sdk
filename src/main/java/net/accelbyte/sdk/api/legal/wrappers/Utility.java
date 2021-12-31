package net.accelbyte.sdk.api.legal.wrappers;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operations.utility.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Utility {

    private AccelByteSDK sdk;

    public Utility(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public LegalReadinessStatusResponse checkReadiness(CheckReadiness input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CheckReadiness()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}