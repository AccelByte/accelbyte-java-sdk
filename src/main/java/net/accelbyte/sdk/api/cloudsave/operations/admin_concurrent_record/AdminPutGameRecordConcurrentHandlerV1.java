/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.admin_concurrent_record;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.models.ModelsAdminConcurrentRecordRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * adminPutGameRecordConcurrentHandlerV1
 *
 * Required Permission | `ADMIN:NAMESPACE:{namespace}:CLOUDSAVE:RECORD [UPDATE]`
 * --------------------|---------------------------------------------------------
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
 * Reserved Word List: __META
 * 
 * The reserved word cannot be used as a field in record value,
 * If still defining the field when creating or updating the record, it will be ignored.
 * 
 * 
 * 
 * 
 * ## Parameters Notes
 * 
 * 
 * 1. set_by (default: CLIENT, type: string)
 * Indicate which party that could modify the game record.
 * SERVER: record can be modified by server only.
 * CLIENT: record can be modified by client and server.
 * 2. updatedAt (required: true)
 * Time format style: RFC3339
 * 3. value
 * Json
 *  Request Body Example:
 * 
 * 
 * 
 * 
 *         {
 *             "set_by": "SERVER",
 *             "value": {},
 *             "updatedAt": "2022-03-17T10:42:15.444Z"
 *         }
 * 
 * 
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
public class AdminPutGameRecordConcurrentHandlerV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/cloudsave/v1/admin/namespaces/{namespace}/concurrent/records/{key}";
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
    private ModelsAdminConcurrentRecordRequest body;

    /**
    * @param key required
    * @param namespace required
    * @param body required
    */
    @Builder
    public AdminPutGameRecordConcurrentHandlerV1(
            String key,
            String namespace,
            ModelsAdminConcurrentRecordRequest body
    )
    {
        this.key = key;
        this.namespace = namespace;
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
        return pathParams;
    }



    @Override
    public ModelsAdminConcurrentRecordRequest getBodyParams(){
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
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}