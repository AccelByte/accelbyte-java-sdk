package net.accelbyte.sdk.api.lobby.wrappers;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operations.friends.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Friends {

    private AccelByteSDK sdk;

    public Friends(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public List<ModelGetUserFriendsResponse> getUserFriendsUpdated(GetUserFriendsUpdated input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserFriendsUpdated()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelGetUserIncomingFriendsResponse> getUserIncomingFriends(GetUserIncomingFriends input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserIncomingFriends()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelGetUserOutgoingFriendsResponse> getUserOutgoingFriends(GetUserOutgoingFriends input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserOutgoingFriends()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void userRequestFriend(UserRequestFriend input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UserRequestFriend()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void userAcceptFriendRequest(UserAcceptFriendRequest input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UserAcceptFriendRequest()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void userCancelFriendRequest(UserCancelFriendRequest input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UserCancelFriendRequest()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void userRejectFriendRequest(UserRejectFriendRequest input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UserRejectFriendRequest()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserGetFriendshipStatusResponse userGetFriendshipStatus(UserGetFriendshipStatus input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UserGetFriendshipStatus()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void userUnfriendRequest(UserUnfriendRequest input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UserUnfriendRequest()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void addFriendsWithoutConfirmation(AddFriendsWithoutConfirmation input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AddFriendsWithoutConfirmation()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelGetFriendsResponse getListOfFriends(GetListOfFriends input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetListOfFriends()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}