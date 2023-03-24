package net.accelbyte.sdk.api.customsearch;

import net.accelbyte.sdk.api.customsearch.models.CustomSearchResult;
import net.accelbyte.sdk.api.customsearch.operations.GoogleCustomSearch;
import net.accelbyte.sdk.api.customsearch.repository.CustomSearchConfigRepository;
import net.accelbyte.sdk.api.customsearch.wrappers.CustomSearch;
import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;

public class Main {
    public static void main(String[] args) throws Exception {
        OkhttpClient client = new OkhttpClient();
        CustomSearchConfigRepository configRepo =  new CustomSearchConfigRepository();
        AccelByteConfig config = new AccelByteConfig(
                client, new DefaultTokenRepository(), configRepo);
        AccelByteSDK sdk = new AccelByteSDK(config);
        CustomSearch search = new CustomSearch(sdk);
        CustomSearchResult res = search.customSearch(GoogleCustomSearch.builder()
                .cx(System.getenv(GoogleCustomSearch.Fields.cx))
                .key(System.getenv(GoogleCustomSearch.Fields.key))
                .safe(System.getenv(GoogleCustomSearch.Fields.safe))
                .q(System.getenv(GoogleCustomSearch.Fields.q))
                .num(Integer.parseInt(System.getenv(GoogleCustomSearch.Fields.num)))
                .build());
    }
}
