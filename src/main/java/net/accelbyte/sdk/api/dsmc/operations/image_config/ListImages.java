/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.image_config;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.models.ModelsListImageResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * ListImages
 *
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [READ]
 * 
 * Required scope: social
 * 
 * This endpoint lists all of dedicated servers images.
 */
@Getter
@Setter
public class ListImages extends Operation {
    /**
     * generated field's value
     */
    private String url = "/dsmcontroller/admin/namespaces/{namespace}/images";
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
    private Integer count;
    private Integer offset;
    private String q;
    private String sortBy;
    private String sortDirection;

    /**
    * @param namespace required
    */
    @Builder
    public ListImages(
            String namespace,
            Integer count,
            Integer offset,
            String q,
            String sortBy,
            String sortDirection
    )
    {
        this.namespace = namespace;
        this.count = count;
        this.offset = offset;
        this.q = q;
        this.sortBy = sortBy;
        this.sortDirection = sortDirection;
        
        securities.add("Bearer");
    }

    public ListImages createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("count", this.count == null ? null : Arrays.asList(String.valueOf(this.count)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("q", this.q == null ? null : Arrays.asList(this.q));
        queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
        queryParams.put("sortDirection", this.sortDirection == null ? null : Arrays.asList(this.sortDirection));
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
    public ModelsListImageResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsListImageResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("count", "None");
        result.put("offset", "None");
        result.put("q", "None");
        result.put("sortBy", "None");
        result.put("sortDirection", "None");
        return result;
    }
}