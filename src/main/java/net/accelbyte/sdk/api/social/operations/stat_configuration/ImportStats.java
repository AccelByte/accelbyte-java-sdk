/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.stat_configuration;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.models.StatImportInfo;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * importStats
 *
 * Import stat configurations for a given namespace from file. At current, only JSON file is supported.
 * 
 * Other detail info:
 *           *  *Required permission*: resource="ADMIN:NAMESPACE:{namespace}:STAT", action=1 (CREATE)
 */
@Getter
@Setter
public class ImportStats extends Operation {
    /**
     * generated field's value
     */
    private String url = "/social/v1/admin/namespaces/{namespace}/stats/import";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("multipart/form-data");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private Boolean replaceExisting;
    private InputStream file;

    /**
    * @param namespace required
    */
    @Builder
    public ImportStats(
            String namespace,
            Boolean replaceExisting,
            InputStream file
    )
    {
        this.namespace = namespace;
        this.replaceExisting = replaceExisting;
        this.file = file;
        
        securities.add("Bearer");
    }

    public ImportStats createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("replaceExisting", this.replaceExisting == null ? null : Arrays.asList(String.valueOf(this.replaceExisting)));
        return queryParams;
    }



    @Override
    public Map<String, Object> getFormDataParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.file != null) {
            formDataParams.put("file", this.file);
        }
        return formDataParams;
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
    public StatImportInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new StatImportInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("replaceExisting", "None");
        return result;
    }
}