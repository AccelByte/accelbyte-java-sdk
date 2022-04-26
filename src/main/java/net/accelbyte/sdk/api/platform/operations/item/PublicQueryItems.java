/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.item;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.ItemPagingSlicedResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * publicQueryItems
 *
 * This API is used to query items by criteria within a store. If item not exist in specific region, default region item will return.
 * 
 * Other detail info:
 * 
 *   * Optional permission : resource="PREVIEW", action=1(CREATE) (user with this permission can view draft store item)
 *   *  Optional permission : resource="SANDBOX", action=1(CREATE) (user with this permission can view draft store item)
 *   *  Returns : the list of items
 */
@Getter
@Setter
public class PublicQueryItems extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/public/namespaces/{namespace}/items/byCriteria";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String appType;
    private String baseAppId;
    private String categoryPath;
    private String features;
    private String itemType;
    private String language;
    private Integer limit;
    private Integer offset;
    private String region;
    private String sortBy;
    private String storeId;
    private String tags;

    /**
    * @param namespace required
    */
    @Builder
    public PublicQueryItems(
            String namespace,
            String appType,
            String baseAppId,
            String categoryPath,
            String features,
            String itemType,
            String language,
            Integer limit,
            Integer offset,
            String region,
            String sortBy,
            String storeId,
            String tags
    )
    {
        this.namespace = namespace;
        this.appType = appType;
        this.baseAppId = baseAppId;
        this.categoryPath = categoryPath;
        this.features = features;
        this.itemType = itemType;
        this.language = language;
        this.limit = limit;
        this.offset = offset;
        this.region = region;
        this.sortBy = sortBy;
        this.storeId = storeId;
        this.tags = tags;
        
    }

    public PublicQueryItems createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("appType", this.appType == null ? null : Arrays.asList(this.appType));
        queryParams.put("baseAppId", this.baseAppId == null ? null : Arrays.asList(this.baseAppId));
        queryParams.put("categoryPath", this.categoryPath == null ? null : Arrays.asList(this.categoryPath));
        queryParams.put("features", this.features == null ? null : Arrays.asList(this.features));
        queryParams.put("itemType", this.itemType == null ? null : Arrays.asList(this.itemType));
        queryParams.put("language", this.language == null ? null : Arrays.asList(this.language));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
        queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
        queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
        queryParams.put("tags", this.tags == null ? null : Arrays.asList(this.tags));
        return queryParams;
    }




    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public ItemPagingSlicedResult parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ItemPagingSlicedResult().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("appType", "None");
        result.put("baseAppId", "None");
        result.put("categoryPath", "None");
        result.put("features", "None");
        result.put("itemType", "None");
        result.put("language", "None");
        result.put("limit", "None");
        result.put("offset", "None");
        result.put("region", "None");
        result.put("sortBy", "None");
        result.put("storeId", "None");
        result.put("tags", "None");
        return result;
    }
}