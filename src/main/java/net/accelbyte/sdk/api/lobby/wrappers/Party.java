package net.accelbyte.sdk.api.lobby.wrappers;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operations.party.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Party {

    private AccelByteSDK sdk;

    public Party(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsPartyData adminGetPartyDataV1(AdminGetPartyDataV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetPartyDataV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsPartyData adminGetUserPartyV1(AdminGetUserPartyV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetUserPartyV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsPartyData publicGetPartyDataV1(PublicGetPartyDataV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetPartyDataV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsPartyData publicUpdatePartyAttributesV1(PublicUpdatePartyAttributesV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicUpdatePartyAttributesV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}