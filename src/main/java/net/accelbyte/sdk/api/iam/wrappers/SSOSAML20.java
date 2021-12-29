package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.sso_saml_2_0.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class SSOSAML20 {

    private AccelByteSDK sdk;

    public SSOSAML20(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public void platformAuthenticateSAMLV3Handler(PlatformAuthenticateSAMLV3Handler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PlatformAuthenticateSAMLV3Handler()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
