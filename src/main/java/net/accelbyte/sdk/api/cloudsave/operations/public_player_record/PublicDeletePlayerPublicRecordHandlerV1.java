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
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * publicDeletePlayerPublicRecordHandlerV1
 *
 * Required valid user authorization
 * Required scope: `social`
 * 
 * Delete player public record.
 * 
 * 
 * 
 * 
 * ## Warning: This endpoint is going to deprecate
 * 
 * 
 * 
 * This endpoint is going to deprecate in the future please don't use it.
 * 
 * For alternative, please use these endpoints:
 * - POST /cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key} and utilizing __META functionality
 * - PUT /cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key} and utilizing __META functionality
 * - DELETE /cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key}
 */
@Getter
@Setter
public class PublicDeletePlayerPublicRecordHandlerV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/cloudsave/v1/namespaces/{namespace}/users/me/records/{key}/public";
    private String method = "DELETE";
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
    public PublicDeletePlayerPublicRecordHandlerV1(
            String key,
            String namespace
    )
    {
        this.key = key;
        this.namespace = namespace;
        
        securities.add("Bearer");
    }

    public PublicDeletePlayerPublicRecordHandlerV1 createFromJson(String json) throws JsonProcessingException {
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
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}