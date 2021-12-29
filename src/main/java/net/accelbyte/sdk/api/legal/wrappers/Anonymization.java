package net.accelbyte.sdk.api.legal.wrappers;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operations.anonymization.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Anonymization {

    private AccelByteSDK sdk;

    public Anonymization(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public void anonymizeUserAgreement(AnonymizeUserAgreement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AnonymizeUserAgreement()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
