package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.sso.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class SSO {

    private AccelByteSDK sdk;

    public SSO(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public void loginSSOClient(LoginSSOClient input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new LoginSSOClient()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void logoutSSOClient(LogoutSSOClient input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new LogoutSSOClient()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
