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
import net.accelbyte.sdk.api.iam.models.ModelRoleResponse;
import net.accelbyte.sdk.api.iam.models.ModelRoleUpdateRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * UpdateRole
 *
 * 
 * 
 * Required permission 'ROLE:ADMIN [UPDATE]' or 'ADMIN:ROLE [UPDATE]'
 * 
 * 
 * 
 * 
 * Required Permission 'ROLE:ADMIN [UPDATE]' is going to be DEPRECATED for security purpose.
 * It is going to be deprecated on 31 JANUARY 2019 , please use permission 'ADMIN:ROLE [UPDATE]' instead.
 */
@Getter
@Setter
public class UpdateRole extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/roles/{roleId}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String roleId;
    private ModelRoleUpdateRequest body;

    /**
    * @param roleId required
    * @param body required
    */
    @Builder
    public UpdateRole(
            String roleId,
            ModelRoleUpdateRequest body
    )
    {
        this.roleId = roleId;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateRole createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.roleId != null){
            pathParams.put("roleId", this.roleId);
        }
        return pathParams;
    }



    @Override
    public ModelRoleUpdateRequest getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.roleId == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelRoleResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelRoleResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}