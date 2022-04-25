/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.admin_game_record;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.models.ModelsGameRecordResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * adminGetGameRecordHandlerV1
 *
 * Required permission: `ADMIN:NAMESPACE:{namespace}:CLOUDSAVE:RECORD [READ]`
 * 
 * Required scope: `social`
 * 
 * Get a record by its key in namespace-level.
 */
@Getter
@Setter
public class AdminGetGameRecordHandlerV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/cloudsave/v1/admin/namespaces/{namespace}/records/{key}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String key;
    private String namespace;

    /**
    * @param key required
    * @param namespace required
    */
    @Builder
    public AdminGetGameRecordHandlerV1(
            String key,
            String namespace
    )
    {
        this.key = key;
        this.namespace = namespace;
        
        securities.add("Bearer");
    }

    public AdminGetGameRecordHandlerV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.key != null){
            pathParams.put("key", this.key);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }





    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.key == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsGameRecordResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsGameRecordResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}