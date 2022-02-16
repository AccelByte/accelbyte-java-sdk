/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.platform.operations.item;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.FullItemPagingSlicedResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * queryItems
 *
 * This API is used to query items by criteria within a store.
 * 
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:ITEM", action=2 (READ)
 *   *  Returns : the list of items
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class QueryItems extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/admin/namespaces/{namespace}/items/byCriteria";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList();

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private String namespace;
    private Boolean activeOnly;
    private String appType;
    private String availableDate;
    private String baseAppId;
    private String categoryPath;
    private String features;
    private String itemType;
    private Integer limit;
    private Integer offset;
    private String region;
    private String sortBy;
    private String storeId;
    private String tags;
    private String targetNamespace;

    /**
    * @param namespace required
    */
    public QueryItems(
            String namespace,
            Boolean activeOnly,
            String appType,
            String availableDate,
            String baseAppId,
            String categoryPath,
            String features,
            String itemType,
            Integer limit,
            Integer offset,
            String region,
            String sortBy,
            String storeId,
            String tags,
            String targetNamespace
    )
    {
        this.namespace = namespace;
        this.activeOnly = activeOnly;
        this.appType = appType;
        this.availableDate = availableDate;
        this.baseAppId = baseAppId;
        this.categoryPath = categoryPath;
        this.features = features;
        this.itemType = itemType;
        this.limit = limit;
        this.offset = offset;
        this.region = region;
        this.sortBy = sortBy;
        this.storeId = storeId;
        this.tags = tags;
        this.targetNamespace = targetNamespace;
    }

    @JsonIgnore
    public QueryItems createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("activeOnly", this.activeOnly == null ? null : Arrays.asList(String.valueOf(this.activeOnly)));
        queryParams.put("appType", this.appType == null ? null : Arrays.asList(this.appType));
        queryParams.put("availableDate", this.availableDate == null ? null : Arrays.asList(this.availableDate));
        queryParams.put("baseAppId", this.baseAppId == null ? null : Arrays.asList(this.baseAppId));
        queryParams.put("categoryPath", this.categoryPath == null ? null : Arrays.asList(this.categoryPath));
        queryParams.put("features", this.features == null ? null : Arrays.asList(this.features));
        queryParams.put("itemType", this.itemType == null ? null : Arrays.asList(this.itemType));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
        queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
        queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
        queryParams.put("tags", this.tags == null ? null : Arrays.asList(this.tags));
        queryParams.put("targetNamespace", this.targetNamespace == null ? null : Arrays.asList(this.targetNamespace));
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("activeOnly","activeOnly");
        result.put("appType","appType");
        result.put("availableDate","availableDate");
        result.put("baseAppId","baseAppId");
        result.put("categoryPath","categoryPath");
        result.put("features","features");
        result.put("itemType","itemType");
        result.put("limit","limit");
        result.put("offset","offset");
        result.put("region","region");
        result.put("sortBy","sortBy");
        result.put("storeId","storeId");
        result.put("tags","tags");
        result.put("targetNamespace","targetNamespace");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public FullItemPagingSlicedResult parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new FullItemPagingSlicedResult().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("activeOnly", "None");
        result.put("appType", "None");
        result.put("availableDate", "None");
        result.put("baseAppId", "None");
        result.put("categoryPath", "None");
        result.put("features", "None");
        result.put("itemType", "None");
        result.put("limit", "None");
        result.put("offset", "None");
        result.put("region", "None");
        result.put("sortBy", "None");
        result.put("storeId", "None");
        result.put("tags", "None");
        result.put("targetNamespace", "None");
        return result;
    }
}