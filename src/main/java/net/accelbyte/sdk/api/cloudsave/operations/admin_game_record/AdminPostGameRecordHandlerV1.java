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
import net.accelbyte.sdk.api.cloudsave.models.ModelsGameRecordRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * adminPostGameRecordHandlerV1
 *
 * Required permission: `ADMIN:NAMESPACE:{namespace}:CLOUDSAVE:RECORD [CREATE]`
 * Required scope: `social`
 * 
 * 
 * 
 * ## Description
 * 
 * 
 * 
 * This endpoints will create new game record or append the existing game record.
 * 
 *  Append example:
 * 
 * Example 1
 * - Existing JSON:
 * 
 * 
 * 
 *     { "data1": "value" }
 * 
 * 
 * - New JSON:
 * 
 * 
 * 
 *     { "data2": "new value" }
 * 
 * 
 * - Result:
 * 
 * 
 * 
 *     { "data1": "value", "data2": "new value" }
 * 
 * 
 * 
 * Example 2
 * - Existing JSON:
 * 
 * 
 * 
 *     { "data1": { "data2": "value" }
 * 
 * 
 * - New JSON:
 * 
 * 
 * 
 *     { "data1": { "data3": "new value" }
 * 
 * 
 * - Result:
 * 
 * 
 * 
 *     { "data1": { "data2": "value", "data3": "new value" }
 * 
 * 
 * 
 * 
 * 
 * 
 * ## Record Metadata
 * 
 * 
 * 
 * Metadata allows user to define the behaviour of the record.
 * Metadata can be defined in request body with field name __META.
 * When creating record, if __META field is not defined, the metadata value will use the default value.
 * When updating record, if __META field is not defined, the existing metadata value will stay as is.
 * 
 *  Metadata List:
 * 1. set_by (default: CLIENT, type: string)
 * Indicate which party that could modify the game record.
 * SERVER: record can be modified by server only.
 * CLIENT: record can be modified by client and server.
 * 
 *  Request Body Example:
 * 
 * 
 * 
 * 
 *         {
 *             "__META": {
 *                 "set_by": "SERVER"
 *             }
 *             ...
 *         }
 */
@Getter
@Setter
public class AdminPostGameRecordHandlerV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/cloudsave/v1/admin/namespaces/{namespace}/records/{key}";
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
    private ModelsGameRecordRequest body;

    /**
    * @param key required
    * @param namespace required
    * @param body required
    */
    @Builder
    public AdminPostGameRecordHandlerV1(
            String key,
            String namespace,
            ModelsGameRecordRequest body
    )
    {
        this.key = key;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public AdminPostGameRecordHandlerV1 createFromJson(String json) throws JsonProcessingException {
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
    public ModelsGameRecordRequest getBodyParams(){
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

    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 201){
            String json = this.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}