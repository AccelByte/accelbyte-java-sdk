package net.accelbyte.sdk.api.seasonpass.wrappers;

import net.accelbyte.sdk.api.seasonpass.models.*;
import net.accelbyte.sdk.api.seasonpass.operations.season.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Season {

    private AccelByteSDK sdk;

    public Season(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public SeasonInfo unpublishSeason(UnpublishSeason input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UnpublishSeason()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SeasonInfo getSeason(GetSeason input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetSeason()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteSeason(DeleteSeason input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteSeason()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SeasonInfo updateSeason(UpdateSeason input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateSeason()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SeasonInfo cloneSeason(CloneSeason input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CloneSeason()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ListSeasonInfoPagingSlicedResult querySeasons(QuerySeasons input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QuerySeasons()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SeasonInfo createSeason(CreateSeason input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateSeason()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SeasonInfo retireSeason(RetireSeason input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RetireSeason()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SeasonInfo publishSeason(PublishSeason input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublishSeason()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SeasonSummary getCurrentSeason(GetCurrentSeason input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetCurrentSeason()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public Ownership existsAnyPassByPassCodes(ExistsAnyPassByPassCodes input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ExistsAnyPassByPassCodes()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ClaimableUserSeasonInfo getUserSeason(GetUserSeason input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserSeason()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void checkSeasonPurchasable(CheckSeasonPurchasable input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new CheckSeasonPurchasable()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public UserSeasonSummary getCurrentUserSeasonProgression(GetCurrentUserSeasonProgression input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetCurrentUserSeasonProgression()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void resetUserSeason(ResetUserSeason input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new ResetUserSeason()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ListUserSeasonInfoPagingSlicedResult getUserParticipatedSeasons(GetUserParticipatedSeasons input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserParticipatedSeasons()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public LocalizedSeasonInfo publicGetCurrentSeason(PublicGetCurrentSeason input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetCurrentSeason()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ClaimableUserSeasonInfo publicGetCurrentUserSeason(PublicGetCurrentUserSeason input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetCurrentUserSeason()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ClaimableUserSeasonInfo publicGetUserSeason(PublicGetUserSeason input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserSeason()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
