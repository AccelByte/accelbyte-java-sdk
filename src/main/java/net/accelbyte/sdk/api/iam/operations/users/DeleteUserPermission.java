/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * DeleteUserPermission
 *
 * Required permission 'ADMIN:NAMESPACE:{namespace}:PERMISSION:USER:{userId} [DELETE]'
 */
@Getter
@Setter
public class DeleteUserPermission extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/namespaces/{namespace}/users/{userId}/permissions/{resource}/{action}";
    private String method = "DELETE";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private Integer action;
    private String namespace;
    private String resource;
    private String userId;

    /**
    * @param action required
    * @param namespace required
    * @param resource required
    * @param userId required
    */
    @Builder
    public DeleteUserPermission(
            Integer action,
            String namespace,
            String resource,
            String userId
    )
    {
        this.action = action;
        this.namespace = namespace;
        this.resource = resource;
        this.userId = userId;
        
        securities.add("Bearer");
    }

    public DeleteUserPermission createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.action != null){
            pathParams.put("action", this.action == null ? null : String.valueOf(this.action));
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.resource != null){
            pathParams.put("resource", this.resource);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }





    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.action == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.resource == null) {
            return false;
        }
        if(this.userId == null) {
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