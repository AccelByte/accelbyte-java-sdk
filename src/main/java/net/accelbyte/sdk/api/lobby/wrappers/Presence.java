package net.accelbyte.sdk.api.lobby.wrappers;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operations.presence.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Presence {

    private AccelByteSDK sdk;

    public Presence(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public HandlersGetUsersPresenceResponse usersPresenceHandlerV1(UsersPresenceHandlerV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UsersPresenceHandlerV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}