/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.catalog_changes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * queryChanges
 *
 * This API is used to query changes .
 * 
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:STORE", action=2 (READ)
 *   *  Returns : the pagination of changes
 */
@Getter
@Setter
public class QueryChanges extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/namespaces/{namespace}/stores/{storeId}/catalogChanges/byCriteria";
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
    private String storeId;
    private String action;
    private String itemType;
    private Integer limit;
    private Integer offset;
    private String sortBy;
    private String status;
    private String type;
    private String updatedAtEnd;
    private String updatedAtStart;

    /**
    * @param namespace required
    * @param storeId required
    */
    @Builder
    public QueryChanges(
            String namespace,
            String storeId,
            String action,
            String itemType,
            Integer limit,
            Integer offset,
            String sortBy,
            String status,
            String type,
            String updatedAtEnd,
            String updatedAtStart
    )
    {
        this.namespace = namespace;
        this.storeId = storeId;
        this.action = action;
        this.itemType = itemType;
        this.limit = limit;
        this.offset = offset;
        this.sortBy = sortBy;
        this.status = status;
        this.type = type;
        this.updatedAtEnd = updatedAtEnd;
        this.updatedAtStart = updatedAtStart;
        
        securities.add("Bearer");
    }

    public QueryChanges createFromJson(String json) throws JsonProcessingException {
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
        if (this.storeId != null){
            pathParams.put("storeId", this.storeId);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("action", this.action == null ? null : Arrays.asList(this.action));
        queryParams.put("itemType", this.itemType == null ? null : Arrays.asList(this.itemType));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
        queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
        queryParams.put("type", this.type == null ? null : Arrays.asList(this.type));
        queryParams.put("updatedAtEnd", this.updatedAtEnd == null ? null : Arrays.asList(this.updatedAtEnd));
        queryParams.put("updatedAtStart", this.updatedAtStart == null ? null : Arrays.asList(this.updatedAtStart));
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
        if(this.storeId == null) {
            return false;
        }
        return true;
    }

    public List<CatalogChangePagingSlicedResult> parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<CatalogChangePagingSlicedResult>>() {});
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("action", "None");
        result.put("itemType", "None");
        result.put("limit", "None");
        result.put("offset", "None");
        result.put("sortBy", "None");
        result.put("status", "None");
        result.put("type", "None");
        result.put("updatedAtEnd", "None");
        result.put("updatedAtStart", "None");
        return result;
    }
}