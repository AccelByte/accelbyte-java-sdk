/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.cloudsave.operations.concurrent_record;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.models.ModelsConcurrentRecordRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * putGameRecordConcurrentHandlerV1
 *
 * Required Permission | `NAMESPACE:{namespace}:CLOUDSAVE:RECORD [UPDATE]`
 * --------------------|---------------------------------------------------
 * Required Scope      | `social`
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * ## Description
 * 
 * 
 * 
 * This endpoints will create new game record or replace the existing game record.
 * 
 *  Replace behaviour:
 * The existing value will be replaced completely with the new value.
 * 
 * Example
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
 *     { "data2": "new value" }
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * ## Reserved Word
 * 
 * 
 * 
 * Reserved Word List: META
 * 
 * The reserved word cannot be used as a field in record value,
 * If still defining the field when creating or updating the record, it will be ignored.
 * 
 * 
 * 
 * 
 * ## Optimistic Concurrency Control
 * 
 * 
 * 
 * This endpoint implement optimistic concurrency control to avoid race condition.
 * If the record has been updated since the client fetch it, the server will return HTTP status code 412 (precondition failed)
 * and client need to redo the operation (fetch data and do update).
 * Otherwise, the server will process the request.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class PutGameRecordConcurrentHandlerV1 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/cloudsave/v1/namespaces/{namespace}/concurrent/records/{key}";

    @JsonIgnore
    private String method = "PUT";

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
    private ModelsConcurrentRecordRequest body;

    /**
    * @param key required
    * @param namespace required
    * @param body required
    */
    @Builder
    public PutGameRecordConcurrentHandlerV1(
            String key,
            String namespace,
            ModelsConcurrentRecordRequest body
    )
    {
        this.key = key;
        this.namespace = namespace;
        this.body = body;
    }

    @JsonIgnore
    public PutGameRecordConcurrentHandlerV1 createFromJson(String json) throws JsonProcessingException {
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
    public ModelsConcurrentRecordRequest getBodyParams(){
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
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}