/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.concurrent_record;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.models.ModelsConcurrentRecordRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * putPlayerRecordConcurrentHandlerV1
 *
 * Required Permission | `NAMESPACE:{namespace}:USER:{userId}:CLOUDSAVE:RECORD [UPDATE]`
 * --------------------|-----------------------------------------------------------------
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
 * This endpoints will create new player record or replace the existing player record.
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
 * Reserved Word List: __META
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
public class PutPlayerRecordConcurrentHandlerV1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/cloudsave/v1/namespaces/{namespace}/users/{userId}/concurrent/records/{key}";
    private String method = "PUT";
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
    private String userId;
    private ModelsConcurrentRecordRequest body;

    /**
    * @param key required
    * @param namespace required
    * @param userId required
    * @param body required
    */
    @Builder
    public PutPlayerRecordConcurrentHandlerV1(
            String key,
            String namespace,
            String userId,
            ModelsConcurrentRecordRequest body
    )
    {
        this.key = key;
        this.namespace = namespace;
        this.userId = userId;
        this.body = body;
        
        securities.add("Bearer");
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
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }



    @Override
    public ModelsConcurrentRecordRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.key == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 204){
            String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}