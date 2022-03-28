/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.cloudsave.operations.public_player_record;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.models.ModelsPlayerRecordRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * postPlayerPublicRecordHandlerV1
 *
 * Required Permission | `NAMESPACE:{namespace}:USER:{userId}:PUBLIC:CLOUDSAVE:RECORD [WRITE]`
 * --------------------|-----------------------------------------------------------------------
 * Required Scope      | `social`
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
 * This endpoints will create new player public record or append the existing player public record.
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
 * 
 * ## Reserved Word
 * 
 * 
 * 
 * Reserved Word List: META
 * 
 * The reserved word cannot be used as a field in record value,
 * If still defining the field when creating or updating the record, it will be ignored.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class PostPlayerPublicRecordHandlerV1 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key}/public";

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
    private String userId;
    private ModelsPlayerRecordRequest body;

    /**
    * @param key required
    * @param namespace required
    * @param userId required
    * @param body required
    */
    @Builder
    public PostPlayerPublicRecordHandlerV1(
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
    }

    @JsonIgnore
    public PostPlayerPublicRecordHandlerV1 createFromJson(String json) throws JsonProcessingException {
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
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public ModelsPlayerRecordRequest getBodyParams(){
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
        result.put("userId","userId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "key",
            "namespace",
            "userId"
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
        if(this.userId == null) {
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