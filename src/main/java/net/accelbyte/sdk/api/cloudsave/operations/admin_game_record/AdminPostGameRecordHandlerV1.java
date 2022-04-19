/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.admin_game_record;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.models.ModelsGameRecordRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

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
 * Metadata can be defined in request body with field name META.
 * When creating record, if META field is not defined, the metadata value will use the default value.
 * When updating record, if META field is not defined, the existing metadata value will stay as is.
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
 *             "META": {
 *                 "set_by": "SERVER"
 *             }
 *             ...
 *         }
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminPostGameRecordHandlerV1 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/cloudsave/v1/admin/namespaces/{namespace}/records/{key}";

    @JsonIgnore
    private String method = "POST";

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
    }

    @JsonIgnore
    public AdminPostGameRecordHandlerV1 createFromJson(String json) throws JsonProcessingException {
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
        if (this.key != null){
            pathParams.put("key", this.key);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public ModelsGameRecordRequest getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("key","key");
        result.put("namespace","namespace");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "key",
            "namespace"
        );
    }

    @Override
    @JsonIgnore
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
    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 201){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}