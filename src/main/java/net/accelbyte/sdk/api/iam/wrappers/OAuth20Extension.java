package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class OAuth20Extension {

    private AccelByteSDK sdk;

    public OAuth20Extension(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public String userAuthenticationV3(UserAuthenticationV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UserAuthenticationV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OauthmodelCountryLocationResponse getCountryLocationV3(GetCountryLocationV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetCountryLocationV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void logout(Logout input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new Logout()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public String platformAuthenticationV3(PlatformAuthenticationV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PlatformAuthenticationV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
