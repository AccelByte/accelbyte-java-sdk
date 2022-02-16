/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.dsmc.operations.admin;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.models.ModelsListSessionResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * ListSession
 *
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSM:SESSION [READ]
 * 
 * Required scope: social
 * 
 * This endpoint lists all of sessions in a namespace managed by this service.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class ListSession extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/dsmcontroller/admin/namespaces/{namespace}/sessions";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json");

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
    private Integer count;
    private Integer offset;
    private String region;
    private Boolean withServer;

    /**
    * @param namespace required
    */
    public ListSession(
            String namespace,
            Integer count,
            Integer offset,
            String region,
            Boolean withServer
    )
    {
        this.namespace = namespace;
        this.count = count;
        this.offset = offset;
        this.region = region;
        this.withServer = withServer;
    }

    @JsonIgnore
    public ListSession createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("count", this.count == null ? null : Arrays.asList(String.valueOf(this.count)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
        queryParams.put("withServer", this.withServer == null ? null : Arrays.asList(String.valueOf(this.withServer)));
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
        result.put("count","count");
        result.put("offset","offset");
        result.put("region","region");
        result.put("withServer","withServer");
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
    public ModelsListSessionResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsListSessionResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("count", "None");
        result.put("offset", "None");
        result.put("region", "None");
        result.put("withServer", "None");
        return result;
    }
}