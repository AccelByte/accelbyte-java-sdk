package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class OAuth20 {

    private AccelByteSDK sdk;

    public OAuth20(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public OauthmodelTokenThirdPartyResponse adminRetrieveUserThirdPartyPlatformTokenV3(AdminRetrieveUserThirdPartyPlatformTokenV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminRetrieveUserThirdPartyPlatformTokenV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void revokeUserV3(RevokeUserV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new RevokeUserV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public String authorizeV3(AuthorizeV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AuthorizeV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OauthmodelTokenIntrospectResponse tokenIntrospectionV3(TokenIntrospectionV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TokenIntrospectionV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OauthcommonJWKSet getJWKSV3(GetJWKSV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetJWKSV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OauthmodelTokenThirdPartyResponse retrieveUserThirdPartyPlatformTokenV3(RetrieveUserThirdPartyPlatformTokenV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RetrieveUserThirdPartyPlatformTokenV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public String authCodeRequestV3(AuthCodeRequestV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AuthCodeRequestV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OauthmodelTokenResponse platformTokenGrantV3(PlatformTokenGrantV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PlatformTokenGrantV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OauthapiRevocationList getRevocationListV3(GetRevocationListV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetRevocationListV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void tokenRevocationV3(TokenRevocationV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new TokenRevocationV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OauthmodelTokenResponseV3 tokenGrantV3(TokenGrantV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TokenGrantV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
