package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.UserAuthenticationV3;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;

public class OAuth20Extension {

    private AccelByteSDK sdk;

    public OAuth20Extension(AccelByteSDK sdk) {
        this.sdk = sdk;
    }

    public String userAuthenticationV3(UserAuthenticationV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
        return input
                .parseResponse(
                        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
                );
    }

}
