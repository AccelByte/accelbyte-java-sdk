package net.accelbyte.sdk.api.seasonpass.wrappers;

import net.accelbyte.sdk.api.seasonpass.models.*;
import net.accelbyte.sdk.api.seasonpass.operations.tier.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Tier {

    private AccelByteSDK sdk;

    public Tier(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public net.accelbyte.sdk.api.seasonpass.models.Tier updateTier(UpdateTier input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateTier()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteTier(DeleteTier input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteTier()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TierPagingSlicedResult queryTiers(QueryTiers input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryTiers()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<net.accelbyte.sdk.api.seasonpass.models.Tier> createTier(CreateTier input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateTier()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public UserSeasonSummary grantUserTier(GrantUserTier input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GrantUserTier()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public UserSeasonSummary grantUserExp(GrantUserExp input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GrantUserExp()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
