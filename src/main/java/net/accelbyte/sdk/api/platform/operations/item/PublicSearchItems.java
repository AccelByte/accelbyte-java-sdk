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
import net.accelbyte.sdk.api.platform.models.ItemPagingSlicedResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * publicSearchItems
 *
 * This API is used to search items by keyword in title, description and long description, It's language constrained, also if item not exist in specific region, default region item will return.
 * 
 * Other detail info:
 * 
 *   * Optional permission : resource="PREVIEW", action=1(CREATE) (user with this permission can view draft store item)
 *   *  Optional permission : resource="SANDBOX", action=1(CREATE) (user with this permission can view draft store item)
 *   *  Returns : the list of items
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class PublicSearchItems extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/public/namespaces/{namespace}/items/search";

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
    private Integer limit;
    private Integer offset;
    private String region;
    private String storeId;
    private String keyword;
    private String language;

    /**
    * @param namespace required
    * @param keyword required
    * @param language required
    */
    public PublicSearchItems(
            String namespace,
            Integer limit,
            Integer offset,
            String region,
            String storeId,
            String keyword,
            String language
    )
    {
        this.namespace = namespace;
        this.limit = limit;
        this.offset = offset;
        this.region = region;
        this.storeId = storeId;
        this.keyword = keyword;
        this.language = language;
    }

    @JsonIgnore
    public PublicSearchItems createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
        queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
        queryParams.put("keyword", this.keyword == null ? null : Arrays.asList(this.keyword));
        queryParams.put("language", this.language == null ? null : Arrays.asList(this.language));
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
        result.put("limit","limit");
        result.put("offset","offset");
        result.put("region","region");
        result.put("storeId","storeId");
        result.put("keyword","keyword");
        result.put("language","language");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",




            "keyword",
            "language"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.keyword == null) {
            return false;
        }
        if(this.language == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ItemPagingSlicedResult parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ItemPagingSlicedResult().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("limit", "None");
        result.put("offset", "None");
        result.put("region", "None");
        result.put("storeId", "None");
        result.put("keyword", "None");
        result.put("language", "None");
        return result;
    }
}