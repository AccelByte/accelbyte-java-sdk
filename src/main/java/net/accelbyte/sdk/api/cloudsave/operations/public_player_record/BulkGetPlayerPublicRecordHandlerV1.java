/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.public_player_record;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.models.ModelsBulkGetPlayerRecordResponse;
import net.accelbyte.sdk.api.cloudsave.models.ModelsBulkUserIDsRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * bulkGetPlayerPublicRecordHandlerV1
 *
 * Required Permission | `NAMESPACE:{namespace}:PUBLIC:CLOUDSAVE:RECORD [READ]`
 * --------------------|--------------------------------------------------------
 * Required Scope      | `social`
 * 
 * 
 * 
 * 
 * 
 * Bulk get other player's record that is public by userIds, max allowed 20 at a time. Only record with `isPublic=true` that can be
 * retrieved using this endpoint.
 */
@Getter
@Setter
public class BulkGetPlayerPublicRecordHandlerV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/cloudsave/v1/namespaces/{namespace}/users/bulk/records/{key}/public";
    private String method = "POST";
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
    private ModelsBulkUserIDsRequest body;

    /**
    * @param key required
    * @param namespace required
    * @param body required
    */
    @Builder
    public BulkGetPlayerPublicRecordHandlerV1(
            String key,
            String namespace,
            ModelsBulkUserIDsRequest body
    )
    {
        this.key = key;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public BulkGetPlayerPublicRecordHandlerV1 createFromJson(String json) throws JsonProcessingException {
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
    public ModelsBulkUserIDsRequest getBodyParams(){
        return this.body;
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
    public ModelsBulkGetPlayerRecordResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsBulkGetPlayerRecordResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}