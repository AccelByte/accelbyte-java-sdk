package net.accelbyte.sdk.api.leaderboard.wrappers;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class LeaderboardConfiguration {

    private AccelByteSDK sdk;

    public LeaderboardConfiguration(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsGetAllLeaderboardConfigsResp getLeaderboardConfigurationsAdminV1(GetLeaderboardConfigurationsAdminV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetLeaderboardConfigurationsAdminV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsLeaderboardConfigReq createLeaderboardConfigurationAdminV1(CreateLeaderboardConfigurationAdminV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateLeaderboardConfigurationAdminV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsDeleteBulkLeaderboardsResp deleteBulkLeaderboardConfigurationAdminV1(DeleteBulkLeaderboardConfigurationAdminV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new DeleteBulkLeaderboardConfigurationAdminV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetLeaderboardConfigResp getLeaderboardConfigurationAdminV1(GetLeaderboardConfigurationAdminV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetLeaderboardConfigurationAdminV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetLeaderboardConfigResp updateLeaderboardConfigurationAdminV1(UpdateLeaderboardConfigurationAdminV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateLeaderboardConfigurationAdminV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteLeaderboardConfigurationAdminV1(DeleteLeaderboardConfigurationAdminV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteLeaderboardConfigurationAdminV1()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetAllLeaderboardConfigsPublicResp getLeaderboardConfigurationsPublicV1(GetLeaderboardConfigurationsPublicV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetLeaderboardConfigurationsPublicV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsLeaderboardConfigReq createLeaderboardConfigurationPublicV1(CreateLeaderboardConfigurationPublicV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateLeaderboardConfigurationPublicV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public V2GetAllLeaderboardConfigsPublicResp getLeaderboardConfigurationsPublicV2(GetLeaderboardConfigurationsPublicV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetLeaderboardConfigurationsPublicV2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
