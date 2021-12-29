package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.o_auth.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class OAuth {

    private AccelByteSDK sdk;

    public OAuth(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public void authorization(Authorization input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new Authorization()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OauthcommonJWKSet getJWKS(GetJWKS input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetJWKS()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OauthmodelTokenResponse platformTokenRequestHandler(PlatformTokenRequestHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PlatformTokenRequestHandler()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void revokeUser(RevokeUser input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new RevokeUser()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OauthapiRevocationList getRevocationList(GetRevocationList input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetRevocationList()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void revokeToken(RevokeToken input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new RevokeToken()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void revokeAUser(RevokeAUser input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new RevokeAUser()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OauthmodelTokenResponse tokenGrant(TokenGrant input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TokenGrant()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OauthmodelTokenResponse verifyToken(VerifyToken input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new VerifyToken()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
