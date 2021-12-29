package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.item.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Item {

    private AccelByteSDK sdk;

    public Item(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public FullItemInfo syncInGameItem(SyncInGameItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SyncInGameItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FullItemInfo createItem(CreateItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FullItemInfo getItemByAppId(GetItemByAppId input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetItemByAppId()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FullItemPagingSlicedResult queryItems(QueryItems input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryItems()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<BasicItem> listBasicItemsByFeatures(ListBasicItemsByFeatures input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ListBasicItemsByFeatures()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FullItemInfo getItemBySku(GetItemBySku input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetItemBySku()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PopulatedItemInfo getLocaleItemBySku(GetLocaleItemBySku input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetLocaleItemBySku()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ItemId getItemIdBySku(GetItemIdBySku input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetItemIdBySku()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ItemInfo> bulkGetLocaleItems(BulkGetLocaleItems input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkGetLocaleItems()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FullItemPagingSlicedResult searchItems(SearchItems input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SearchItems()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FullItemPagingSlicedResult queryUncategorizedItems(QueryUncategorizedItems input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryUncategorizedItems()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FullItemInfo getItem(GetItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FullItemInfo updateItem(UpdateItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteItem(DeleteItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteItem()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ItemAcquireResult acquireItem(AcquireItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AcquireItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FullAppInfo getApp(GetApp input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetApp()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FullAppInfo updateApp(UpdateApp input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateApp()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FullItemInfo disableItem(DisableItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new DisableItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ItemDynamicDataInfo getItemDynamicData(GetItemDynamicData input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetItemDynamicData()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FullItemInfo enableItem(EnableItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new EnableItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FullItemInfo featureItem(FeatureItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new FeatureItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FullItemInfo defeatureItem(DefeatureItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new DefeatureItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PopulatedItemInfo getLocaleItem(GetLocaleItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetLocaleItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void returnItem(ReturnItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new ReturnItem()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ItemInfo publicGetItemByAppId(PublicGetItemByAppId input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetItemByAppId()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ItemPagingSlicedResult publicQueryItems(PublicQueryItems input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicQueryItems()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ItemInfo publicGetItemBySku(PublicGetItemBySku input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetItemBySku()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ItemInfo> publicBulkGetItems(PublicBulkGetItems input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicBulkGetItems()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ItemPagingSlicedResult publicSearchItems(PublicSearchItems input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicSearchItems()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AppInfo publicGetApp(PublicGetApp input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetApp()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ItemDynamicDataInfo publicGetItemDynamicData(PublicGetItemDynamicData input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetItemDynamicData()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PopulatedItemInfo publicGetItem(PublicGetItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetItem()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
