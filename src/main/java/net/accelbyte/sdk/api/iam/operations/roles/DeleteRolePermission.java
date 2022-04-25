/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.roles;

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
 * DeleteRolePermission
 *
 * Required permission 'ROLE:ADMIN [UPDATE]' or 'ADMIN:ROLE [UPDATE]'
 * 
 * 
 * Required Permission 'ROLE:ADMIN [UPDATE]' is going to be DEPRECATED for security purpose.
 * It is going to be deprecated on 31 JANUARY 2019 , please use permission 'ADMIN:ROLE [UPDATE]' instead.
 */
@Getter
@Setter
public class DeleteRolePermission extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/roles/{roleId}/permissions/{resource}/{action}";
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
    private String resource;
    private String roleId;

    /**
    * @param action required
    * @param resource required
    * @param roleId required
    */
    @Builder
    public DeleteRolePermission(
            Integer action,
            String resource,
            String roleId
    )
    {
        this.action = action;
        this.resource = resource;
        this.roleId = roleId;
        
        securities.add("Bearer");
    }

    public DeleteRolePermission createFromJson(String json) throws JsonProcessingException {
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
        if (this.resource != null){
            pathParams.put("resource", this.resource);
        }
        if (this.roleId != null){
            pathParams.put("roleId", this.roleId);
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
        if(this.resource == null) {
            return false;
        }
        if(this.roleId == null) {
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