package net.accelbyte.sdk.api.customsearch.wrappers;

import net.accelbyte.sdk.api.customsearch.models.CustomSearchResult;
import net.accelbyte.sdk.api.customsearch.operations.GoogleCustomSearch;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class CustomSearch {
    private AccelByteSDK sdk;

    public CustomSearch(AccelByteSDK sdk) {
        this.sdk = sdk;
    }

    public CustomSearchResult customSearch(GoogleCustomSearch input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
                httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    }
}
