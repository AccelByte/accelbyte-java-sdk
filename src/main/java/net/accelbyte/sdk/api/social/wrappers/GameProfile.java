package net.accelbyte.sdk.api.social.wrappers;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.operations.game_profile.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class GameProfile {

    private AccelByteSDK sdk;

    public GameProfile(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public List<GameProfileHeader> getUserProfiles(GetUserProfiles input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserProfiles()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public GameProfileInfo getProfile(GetProfile input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetProfile()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<UserGameProfiles> publicGetUserGameProfiles(PublicGetUserGameProfiles input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserGameProfiles()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<GameProfileHeader> publicGetUserProfiles(PublicGetUserProfiles input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserProfiles()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicCreateProfile(PublicCreateProfile input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicCreateProfile()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public GameProfileInfo publicGetProfile(PublicGetProfile input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetProfile()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public GameProfileInfo publicUpdateProfile(PublicUpdateProfile input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicUpdateProfile()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicDeleteProfile(PublicDeleteProfile input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicDeleteProfile()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public Attribute publicGetProfileAttribute(PublicGetProfileAttribute input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetProfileAttribute()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public GameProfileInfo publicUpdateAttribute(PublicUpdateAttribute input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicUpdateAttribute()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}