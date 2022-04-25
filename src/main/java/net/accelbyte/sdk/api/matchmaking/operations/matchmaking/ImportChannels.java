/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.operations.matchmaking;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.models.ModelsImportConfigResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * ImportChannels
 *
 * Required Permission: ADMIN:NAMESPACE:{namespace}:MATCHMAKING:CHANNEL [Update]
 * 
 * Required Scope: social
 * 
 * Import channels configuration from file. It will merge with existing channels.
 * Available import strategy:
 * - leaveOut: if channel with same key exist, the existing will be used and imported one will be ignored (default)
 * - replace: if channel with same key exist, the imported channel will be used and existing one will be removed
 * 
 * Action Code: 510113
 */
@Getter
@Setter
public class ImportChannels extends Operation {
    /**
     * generated field's value
     */
    private String url = "/matchmaking/v1/admin/namespaces/{namespace}/channels/import";
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
    private InputStream file;
    private String strategy;

    /**
    * @param namespace required
    */
    @Builder
    public ImportChannels(
            String namespace,
            InputStream file,
            String strategy
    )
    {
        this.namespace = namespace;
        this.file = file;
        this.strategy = strategy;
        
        securities.add("Bearer");
    }

    public ImportChannels createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.file != null) {
            formDataParams.put("file", this.file);
        }
        if (this.strategy != null) {
            formDataParams.put("strategy", this.strategy);
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
    public ModelsImportConfigResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsImportConfigResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}