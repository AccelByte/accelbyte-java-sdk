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
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * publicBulkGetItems
 *
 * This API is used to bulk get locale items. If item not exist in specific region, default region item will return.
 * 
 * Other detail info:
 * 
 *   * Optional permission : resource="PREVIEW", action=1(CREATE) (user with this permission can view draft store items)
 *   *  Optional permission : resource="SANDBOX", action=1(CREATE) (user with this permission can view draft store items)
 *   *  Returns : the list of items info
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class PublicBulkGetItems extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/public/namespaces/{namespace}/items/locale/byIds";

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
    private String language;
    private String region;
    private String storeId;
    private String itemIds;

    /**
    * @param namespace required
    * @param itemIds required
    */
    public PublicBulkGetItems(
            String namespace,
            String language,
            String region,
            String storeId,
            String itemIds
    )
    {
        this.namespace = namespace;
        this.language = language;
        this.region = region;
        this.storeId = storeId;
        this.itemIds = itemIds;
    }

    @JsonIgnore
    public PublicBulkGetItems createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("language", this.language == null ? null : Arrays.asList(this.language));
        queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
        queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
        queryParams.put("itemIds", this.itemIds == null ? null : Arrays.asList(this.itemIds));
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
        result.put("language","language");
        result.put("region","region");
        result.put("storeId","storeId");
        result.put("itemIds","itemIds");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",



            "itemIds"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.itemIds == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public List<ItemInfo> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<ItemInfo>>() {});
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("language", "None");
        result.put("region", "None");
        result.put("storeId", "None");
        result.put("itemIds", "None");
        return result;
    }
}