/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.public_content;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
 * PublicSearchContent
 *
 * Public user can access without token or if token specified, requires valid user token
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class PublicSearchContent extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/ugc/v1/public/namespaces/{namespace}/contents";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json","application/octet-stream");

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
    public PublicSearchContent(
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
    }

    @JsonIgnore
    public PublicSearchContent createFromJson(String json) throws JsonProcessingException {
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
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("creator","creator");
        result.put("isofficial","isofficial");
        result.put("limit","limit");
        result.put("name","name");
        result.put("offset","offset");
        result.put("orderby","orderby");
        result.put("sortby","sortby");
        result.put("subtype","subtype");
        result.put("tags","tags");
        result.put("type","type");
        result.put("userId","userId");
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
    public ModelsPaginatedContentDownloadResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsPaginatedContentDownloadResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
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