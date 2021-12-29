package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.reward.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Reward {

    private AccelByteSDK sdk;

    public Reward(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public RewardInfo createReward(CreateReward input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateReward()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public RewardPagingSlicedResult queryRewards(QueryRewards input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryRewards()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void exportRewards(ExportRewards input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new ExportRewards()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void importRewards(ImportRewards input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new ImportRewards()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public RewardInfo getReward(GetReward input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetReward()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public RewardInfo updateReward(UpdateReward input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateReward()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public RewardInfo deleteReward(DeleteReward input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new DeleteReward()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ConditionMatchResult checkEventCondition(CheckEventCondition input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CheckEventCondition()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public RewardInfo getRewardByCode(GetRewardByCode input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetRewardByCode()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public RewardPagingSlicedResult queryRewards1(QueryRewards1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryRewards1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public RewardInfo getReward1(GetReward1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetReward1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
