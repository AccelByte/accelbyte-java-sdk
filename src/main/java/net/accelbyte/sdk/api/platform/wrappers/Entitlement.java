package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.entitlement.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Entitlement {

    private AccelByteSDK sdk;

    public Entitlement(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public EntitlementPagingSlicedResult queryEntitlements(QueryEntitlements input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryEntitlements()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EntitlementInfo getEntitlement(GetEntitlement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetEntitlement()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EntitlementPagingSlicedResult queryUserEntitlements(QueryUserEntitlements input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryUserEntitlements()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<StackableEntitlementInfo> grantUserEntitlement(GrantUserEntitlement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GrantUserEntitlement()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AppEntitlementInfo getUserAppEntitlementByAppId(GetUserAppEntitlementByAppId input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserAppEntitlementByAppId()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AppEntitlementPagingSlicedResult queryUserEntitlementsByAppType(QueryUserEntitlementsByAppType input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryUserEntitlementsByAppType()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EntitlementInfo getUserEntitlementByItemId(GetUserEntitlementByItemId input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserEntitlementByItemId()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EntitlementInfo getUserEntitlementBySku(GetUserEntitlementBySku input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserEntitlementBySku()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public Ownership existsAnyUserActiveEntitlement(ExistsAnyUserActiveEntitlement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ExistsAnyUserActiveEntitlement()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public Ownership existsAnyUserActiveEntitlementByItemIds(ExistsAnyUserActiveEntitlementByItemIds input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ExistsAnyUserActiveEntitlementByItemIds()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public Ownership getUserAppEntitlementOwnershipByAppId(GetUserAppEntitlementOwnershipByAppId input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserAppEntitlementOwnershipByAppId()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TimedOwnership getUserEntitlementOwnershipByItemId(GetUserEntitlementOwnershipByItemId input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserEntitlementOwnershipByItemId()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TimedOwnership getUserEntitlementOwnershipBySku(GetUserEntitlementOwnershipBySku input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserEntitlementOwnershipBySku()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public BulkOperationResult revokeUserEntitlements(RevokeUserEntitlements input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RevokeUserEntitlements()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EntitlementInfo getUserEntitlement(GetUserEntitlement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserEntitlement()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EntitlementInfo updateUserEntitlement(UpdateUserEntitlement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateUserEntitlement()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EntitlementInfo consumeUserEntitlement(ConsumeUserEntitlement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ConsumeUserEntitlement()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EntitlementInfo disableUserEntitlement(DisableUserEntitlement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new DisableUserEntitlement()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EntitlementInfo enableUserEntitlement(EnableUserEntitlement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new EnableUserEntitlement()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<EntitlementHistoryInfo> getUserEntitlementHistories(GetUserEntitlementHistories input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserEntitlementHistories()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EntitlementInfo revokeUserEntitlement(RevokeUserEntitlement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RevokeUserEntitlement()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public Ownership publicExistsAnyMyActiveEntitlement(PublicExistsAnyMyActiveEntitlement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicExistsAnyMyActiveEntitlement()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public Ownership publicGetMyAppEntitlementOwnershipByAppId(PublicGetMyAppEntitlementOwnershipByAppId input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetMyAppEntitlementOwnershipByAppId()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TimedOwnership publicGetMyEntitlementOwnershipByItemId(PublicGetMyEntitlementOwnershipByItemId input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetMyEntitlementOwnershipByItemId()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TimedOwnership publicGetMyEntitlementOwnershipBySku(PublicGetMyEntitlementOwnershipBySku input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetMyEntitlementOwnershipBySku()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OwnershipToken publicGetEntitlementOwnershipToken(PublicGetEntitlementOwnershipToken input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetEntitlementOwnershipToken()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EntitlementPagingSlicedResult publicQueryUserEntitlements(PublicQueryUserEntitlements input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicQueryUserEntitlements()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AppEntitlementInfo publicGetUserAppEntitlementByAppId(PublicGetUserAppEntitlementByAppId input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserAppEntitlementByAppId()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AppEntitlementPagingSlicedResult publicQueryUserEntitlementsByAppType(PublicQueryUserEntitlementsByAppType input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicQueryUserEntitlementsByAppType()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EntitlementInfo publicGetUserEntitlementByItemId(PublicGetUserEntitlementByItemId input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserEntitlementByItemId()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EntitlementInfo publicGetUserEntitlementBySku(PublicGetUserEntitlementBySku input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserEntitlementBySku()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public Ownership publicExistsAnyUserActiveEntitlement(PublicExistsAnyUserActiveEntitlement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicExistsAnyUserActiveEntitlement()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public Ownership publicGetUserAppEntitlementOwnershipByAppId(PublicGetUserAppEntitlementOwnershipByAppId input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserAppEntitlementOwnershipByAppId()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TimedOwnership publicGetUserEntitlementOwnershipByItemId(PublicGetUserEntitlementOwnershipByItemId input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserEntitlementOwnershipByItemId()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TimedOwnership publicGetUserEntitlementOwnershipBySku(PublicGetUserEntitlementOwnershipBySku input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserEntitlementOwnershipBySku()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EntitlementInfo publicGetUserEntitlement(PublicGetUserEntitlement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserEntitlement()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public EntitlementInfo publicConsumeUserEntitlement(PublicConsumeUserEntitlement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicConsumeUserEntitlement()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
