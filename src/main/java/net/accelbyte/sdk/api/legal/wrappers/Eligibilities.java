package net.accelbyte.sdk.api.legal.wrappers;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operations.eligibilities.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Eligibilities {

    private AccelByteSDK sdk;

    public Eligibilities(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public List<RetrieveUserEligibilitiesResponse> retrieveEligibilitiesPublic(RetrieveEligibilitiesPublic input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RetrieveEligibilitiesPublic()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public RetrieveUserEligibilitiesIndirectResponse retrieveEligibilitiesPublicIndirect(RetrieveEligibilitiesPublicIndirect input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RetrieveEligibilitiesPublicIndirect()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
