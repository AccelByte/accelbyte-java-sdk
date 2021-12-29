package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.store.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Store {

    private AccelByteSDK sdk;

    public Store(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public List<StoreInfo> listStores(ListStores input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ListStores()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StoreInfo createStore(CreateStore input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateStore()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StoreInfo importStore(ImportStore input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ImportStore()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StoreInfo getPublishedStore(GetPublishedStore input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetPublishedStore()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StoreInfo deletePublishedStore(DeletePublishedStore input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new DeletePublishedStore()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StoreBackupInfo getPublishedStoreBackup(GetPublishedStoreBackup input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetPublishedStoreBackup()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StoreInfo rollbackPublishedStore(RollbackPublishedStore input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RollbackPublishedStore()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StoreInfo getStore(GetStore input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetStore()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StoreInfo updateStore(UpdateStore input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateStore()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StoreInfo deleteStore(DeleteStore input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new DeleteStore()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public StoreInfo cloneStore(CloneStore input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CloneStore()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void exportStore(ExportStore input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new ExportStore()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<StoreInfo> publicListStores(PublicListStores input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicListStores()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
