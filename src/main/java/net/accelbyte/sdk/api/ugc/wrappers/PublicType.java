package net.accelbyte.sdk.api.ugc.wrappers;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.operations.public_type.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class PublicType {

    private AccelByteSDK sdk;

    public PublicType(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsPaginatedGetTypeResponse getType(GetType input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetType()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}