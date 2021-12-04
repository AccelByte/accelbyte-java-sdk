package net.accelbyte.sdk.api.social.wrappers;

import net.accelbyte.sdk.api.social.models.UserStatItemPagingSlicedResult;
import net.accelbyte.sdk.api.social.operations.user_statistic.GetUserStatItems;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;

public class UserStatistic {
    // TODO : Inject all inside object class
    AccelByteSDK sdk;

    public UserStatistic(AccelByteSDK sdk) {
        this.sdk = sdk;
    }

    /**
     * @see GetUserStatItems
     */
    public UserStatItemPagingSlicedResult getUserStatItems(GetUserStatItems input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
        return new GetUserStatItems().parseResponse(httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    }
}
