package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.order_dedicated.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class OrderDedicated {

    private AccelByteSDK sdk;

    public OrderDedicated(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public OrderSyncResult syncOrders(SyncOrders input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SyncOrders()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
