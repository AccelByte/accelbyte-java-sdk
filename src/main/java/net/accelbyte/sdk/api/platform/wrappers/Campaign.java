package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.campaign.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Campaign {

    private AccelByteSDK sdk;

    public Campaign(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public CampaignPagingSlicedResult queryCampaigns(QueryCampaigns input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryCampaigns()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public CampaignInfo createCampaign(CreateCampaign input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateCampaign()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public CampaignInfo getCampaign(GetCampaign input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetCampaign()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public CampaignInfo updateCampaign(UpdateCampaign input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateCampaign()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public CampaignDynamicInfo getCampaignDynamic(GetCampaignDynamic input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetCampaignDynamic()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public CodeInfoPagingSlicedResult queryCodes(QueryCodes input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryCodes()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public CodeCreateResult createCodes(CreateCodes input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateCodes()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void download(Download input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new Download()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public BulkOperationResult bulkDisableCodes(BulkDisableCodes input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkDisableCodes()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public BulkOperationResult bulkEnableCodes(BulkEnableCodes input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkEnableCodes()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public RedeemHistoryPagingSlicedResult queryRedeemHistory(QueryRedeemHistory input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryRedeemHistory()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public CodeInfo getCode(GetCode input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetCode()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public CodeInfo disableCode(DisableCode input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new DisableCode()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public CodeInfo enableCode(EnableCode input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new EnableCode()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public RedeemResult applyUserRedemption(ApplyUserRedemption input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ApplyUserRedemption()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
