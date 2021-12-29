package net.accelbyte.sdk.api.matchmaking.wrappers;

import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.operations.matchmaking.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Matchmaking {

    private AccelByteSDK sdk;

    public Matchmaking(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsGetChannelsResponse getAllChannelsHandler(GetAllChannelsHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetAllChannelsHandler()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateChannelResponse createChannelHandler(CreateChannelHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateChannelHandler()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteChannelHandler(DeleteChannelHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteChannelHandler()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsMatchResultResponse storeMatchResults(StoreMatchResults input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new StoreMatchResults()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void queueSessionHandler(QueueSessionHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new QueueSessionHandler()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void dequeueSessionHandler(DequeueSessionHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DequeueSessionHandler()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsMatchmakingResult querySessionHandler(QuerySessionHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QuerySessionHandler()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public Map<String, List<ModelsMatchingParty>> getAllPartyInAllChannel(GetAllPartyInAllChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetAllPartyInAllChannel()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelsMatchmakingResult> bulkGetSessions(BulkGetSessions input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkGetSessions()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelsChannelV1> exportChannels(ExportChannels input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ExportChannels()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsImportConfigResponse importChannels(ImportChannels input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ImportChannels()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsChannelV1 getSingleMatchmakingChannel(GetSingleMatchmakingChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetSingleMatchmakingChannel()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void updateMatchmakingChannel(UpdateMatchmakingChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UpdateMatchmakingChannel()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelsMatchingParty> getAllPartyInChannel(GetAllPartyInChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetAllPartyInChannel()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelsMatchmakingResult> getAllSessionsInChannel(GetAllSessionsInChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetAllSessionsInChannel()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void addUserIntoSessionInChannel(AddUserIntoSessionInChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AddUserIntoSessionInChannel()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteSessionInChannel(DeleteSessionInChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteSessionInChannel()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteUserFromSessionInChannel(DeleteUserFromSessionInChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteUserFromSessionInChannel()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ServiceGetSessionHistorySearchResponse searchSessions(SearchSessions input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SearchSessions()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ServiceGetSessionHistoryDetailedResponseItem> getSessionHistoryDetailed(GetSessionHistoryDetailed input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetSessionHistoryDetailed()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelsChannelV1> publicGetAllMatchmakingChannel(PublicGetAllMatchmakingChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetAllMatchmakingChannel()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsChannelV1 publicGetSingleMatchmakingChannel(PublicGetSingleMatchmakingChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetSingleMatchmakingChannel()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
