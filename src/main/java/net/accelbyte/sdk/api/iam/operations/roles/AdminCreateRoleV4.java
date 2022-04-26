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
import net.accelbyte.sdk.api.iam.models.ModelRoleV4Response;
import net.accelbyte.sdk.api.iam.models.ModelRoleV4Request;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminCreateRoleV4
 *
 * Required permission: ADMIN:ROLE [CREATE]
 * 
 * Create role request body:
 * - roleName: specify role name, alphanumeric, cannot have special character (required)
 * - adminRole: specify if role is for admin user (default false)
 * - isWildcard: specify if role can be assigned to wildcard (*) namespace (default false)
 * - deletable: specify if role can be deleted (default true)
 * 
 * action code: 10401
 */
@Getter
@Setter
public class AdminCreateRoleV4 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v4/admin/roles";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private ModelRoleV4Request body;

    /**
    * @param body required
    */
    @Builder
    public AdminCreateRoleV4(
            ModelRoleV4Request body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
    }

    public AdminCreateRoleV4 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }




    @Override
    public ModelRoleV4Request getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        return true;
    }

    @Override
    public ModelRoleV4Response parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelRoleV4Response().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}