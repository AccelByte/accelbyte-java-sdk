package net.accelbyte.sdk.api.social.wrappers;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.operations.user_statistic.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class UserStatistic {

    private AccelByteSDK sdk;

    public UserStatistic(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public List<UserStatItemInfo> bulkFetchStatItems(BulkFetchStatItems input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkFetchStatItems()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> bulkIncUserStatItem(BulkIncUserStatItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkIncUserStatItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> bulkIncUserStatItemValue(BulkIncUserStatItemValue input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkIncUserStatItemValue()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> bulkResetUserStatItem(BulkResetUserStatItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkResetUserStatItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public UserStatItemPagingSlicedResult getUserStatItems(GetUserStatItems input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserStatItems()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> bulkCreateUserStatItems(BulkCreateUserStatItems input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkCreateUserStatItems()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> bulkIncUserStatItem1(BulkIncUserStatItem1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkIncUserStatItem1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> bulkIncUserStatItemValue1(BulkIncUserStatItemValue1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkIncUserStatItemValue1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> bulkResetUserStatItem1(BulkResetUserStatItem1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkResetUserStatItem1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void createUserStatItem(CreateUserStatItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new CreateUserStatItem()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteUserStatItems(DeleteUserStatItems input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteUserStatItems()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StatItemIncResult incUserStatItemValue(IncUserStatItemValue input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new IncUserStatItemValue()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StatItemIncResult resetUserStatItemValue(ResetUserStatItemValue input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ResetUserStatItemValue()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<UserStatItemInfo> bulkFetchStatItems1(BulkFetchStatItems1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkFetchStatItems1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> publicBulkIncUserStatItem(PublicBulkIncUserStatItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicBulkIncUserStatItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> publicBulkIncUserStatItemValue(PublicBulkIncUserStatItemValue input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicBulkIncUserStatItemValue()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> bulkResetUserStatItem2(BulkResetUserStatItem2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkResetUserStatItem2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public UserStatItemPagingSlicedResult publicQueryUserStatItems(PublicQueryUserStatItems input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicQueryUserStatItems()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> publicBulkCreateUserStatItems(PublicBulkCreateUserStatItems input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicBulkCreateUserStatItems()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> publicBulkIncUserStatItem1(PublicBulkIncUserStatItem1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicBulkIncUserStatItem1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> bulkIncUserStatItemValue2(BulkIncUserStatItemValue2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkIncUserStatItemValue2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> bulkResetUserStatItem3(BulkResetUserStatItem3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkResetUserStatItem3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicCreateUserStatItem(PublicCreateUserStatItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicCreateUserStatItem()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteUserStatItems1(DeleteUserStatItems1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteUserStatItems1()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StatItemIncResult publicIncUserStatItem(PublicIncUserStatItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicIncUserStatItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StatItemIncResult publicIncUserStatItemValue(PublicIncUserStatItemValue input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicIncUserStatItemValue()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StatItemIncResult resetUserStatItemValue1(ResetUserStatItemValue1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ResetUserStatItemValue1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> bulkUpdateUserStatItemV2(BulkUpdateUserStatItemV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkUpdateUserStatItemV2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> bulkUpdateUserStatItem(BulkUpdateUserStatItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkUpdateUserStatItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteUserStatItems2(DeleteUserStatItems2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteUserStatItems2()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StatItemIncResult updateUserStatItemValue(UpdateUserStatItemValue input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateUserStatItemValue()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> bulkUpdateUserStatItem1(BulkUpdateUserStatItem1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkUpdateUserStatItem1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BulkStatItemOperationResult> bulkUpdateUserStatItem2(BulkUpdateUserStatItem2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkUpdateUserStatItem2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StatItemIncResult updateUserStatItemValue1(UpdateUserStatItemValue1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateUserStatItemValue1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
