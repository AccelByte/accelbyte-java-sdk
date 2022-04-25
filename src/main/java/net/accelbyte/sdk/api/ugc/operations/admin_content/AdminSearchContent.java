/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.admin_content;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.models.ModelsPaginatedContentDownloadResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminSearchContent
 *
 * Required permission ADMIN:NAMESPACE:{namespace}:USER:*:CONTENT [READ]
 */
@Getter
@Setter
public class AdminSearchContent extends Operation {
    /**
     * generated field's value
     */
    private String url = "/ugc/v1/admin/namespaces/{namespace}/contents/search";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String creator;
    private String isofficial;
    private Integer limit;
    private String name;
    private Integer offset;
    private String orderby;
    private String sortby;
    private String subtype;
    private String tags;
    private String type;
    private String userId;

    /**
    * @param namespace required
    */
    @Builder
    public AdminSearchContent(
            String namespace,
            String creator,
            String isofficial,
            Integer limit,
            String name,
            Integer offset,
            String orderby,
            String sortby,
            String subtype,
            String tags,
            String type,
            String userId
    )
    {
        this.namespace = namespace;
        this.creator = creator;
        this.isofficial = isofficial;
        this.limit = limit;
        this.name = name;
        this.offset = offset;
        this.orderby = orderby;
        this.sortby = sortby;
        this.subtype = subtype;
        this.tags = tags;
        this.type = type;
        this.userId = userId;
        
        securities.add("Bearer");
    }

    public AdminSearchContent createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("creator", this.creator == null ? null : Arrays.asList(this.creator));
        queryParams.put("isofficial", this.isofficial == null ? null : Arrays.asList(this.isofficial));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("name", this.name == null ? null : Arrays.asList(this.name));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("orderby", this.orderby == null ? null : Arrays.asList(this.orderby));
        queryParams.put("sortby", this.sortby == null ? null : Arrays.asList(this.sortby));
        queryParams.put("subtype", this.subtype == null ? null : Arrays.asList(this.subtype));
        queryParams.put("tags", this.tags == null ? null : Arrays.asList(this.tags));
        queryParams.put("type", this.type == null ? null : Arrays.asList(this.type));
        queryParams.put("userId", this.userId == null ? null : Arrays.asList(this.userId));
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
    public ModelsPaginatedContentDownloadResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsPaginatedContentDownloadResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("creator", "None");
        result.put("isofficial", "None");
        result.put("limit", "None");
        result.put("name", "None");
        result.put("offset", "None");
        result.put("orderby", "None");
        result.put("sortby", "None");
        result.put("subtype", "None");
        result.put("tags", "None");
        result.put("type", "None");
        result.put("userId", "None");
        return result;
    }
}