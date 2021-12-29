package net.accelbyte.sdk.api.sessionbrowser.wrappers;

import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.api.sessionbrowser.operations.session.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Session {

    private AccelByteSDK sdk;

    public Session(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsCountActiveSessionResponse getTotalActiveSession(GetTotalActiveSession input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetTotalActiveSession()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsActiveCustomGameResponse getActiveCustomGameSessions(GetActiveCustomGameSessions input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetActiveCustomGameSessions()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsActiveMatchmakingGameResponse getActiveMatchmakingGameSessions(GetActiveMatchmakingGameSessions input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetActiveMatchmakingGameSessions()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsAdminSessionResponse adminGetSession(AdminGetSession input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetSession()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsSessionQueryResponse querySession(QuerySession input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QuerySession()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsSessionResponse createSession(CreateSession input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateSession()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsSessionByUserIDsResponse getSessionByUserIDs(GetSessionByUserIDs input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetSessionByUserIDs()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsSessionResponse getSession(GetSession input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetSession()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsSessionResponse updateSession(UpdateSession input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateSession()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsSessionResponse deleteSession(DeleteSession input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new DeleteSession()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsSessionResponse joinSession(JoinSession input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new JoinSession()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsSessionResponse deleteSessionLocalDS(DeleteSessionLocalDS input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new DeleteSessionLocalDS()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsAddPlayerResponse addPlayerToSession(AddPlayerToSession input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AddPlayerToSession()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsAddPlayerResponse removePlayerFromSession(RemovePlayerFromSession input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RemovePlayerFromSession()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsRecentPlayerQueryResponse getRecentPlayer(GetRecentPlayer input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetRecentPlayer()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
