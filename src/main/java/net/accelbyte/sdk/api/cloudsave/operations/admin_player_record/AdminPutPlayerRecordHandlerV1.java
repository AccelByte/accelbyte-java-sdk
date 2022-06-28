/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.admin_player_record;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.models.ModelsPlayerRecordRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * adminPutPlayerRecordHandlerV1
 *
 * Required permission: `ADMIN:NAMESPACE:{namespace}:USER:{userId}:CLOUDSAVE:RECORD [UPDATE]`
 * Required scope: `social`
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
 * 2. is_public (default: false, type: bool)
 * Indicate whether the player record is a public record or not.
 * 
 *  Request Body Example:
 * 
 * 
 * 
 * 
 *         {
 *             "__META": {
 *                 "set_by": "SERVER",
 *                 "is_public": true
 *             }
 *             ...
 *         }
 */
@Getter
@Setter
public class AdminPutPlayerRecordHandlerV1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/records/{key}";
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
    private ModelsPlayerRecordRequest body;

    /**
    * @param key required
    * @param namespace required
    * @param userId required
    * @param body required
    */
    @Builder
    public AdminPutPlayerRecordHandlerV1(
            String key,
            String namespace,
            String userId,
            ModelsPlayerRecordRequest body
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
    public ModelsPlayerRecordRequest getBodyParams(){
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
        if(code != 200){
            String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}