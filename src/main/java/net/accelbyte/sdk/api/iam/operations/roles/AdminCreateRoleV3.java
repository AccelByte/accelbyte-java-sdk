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
import net.accelbyte.sdk.api.iam.models.AccountcommonRoleV3;
import net.accelbyte.sdk.api.iam.models.ModelRoleCreateV3Request;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminCreateRoleV3
 *
 * Required permission 'ADMIN:ROLE [CREATE]'
 * 
 * Create role request body:
 * - roleName: specify role name, alphanumeric, cannot have special character (required)
 * - permissions: specify the permission that this role have
 * - managers: specify list of user that will act as the managers of this role
 * - members: specify list of user that will act as the members of this role
 * - adminRole: specify if role is for admin user (default false)
 * - isWildcard: specify if role can be assigned to wildcard (*) namespace (default false)
 * - deletable: specify if role can be deleted or not (default true)
 * 
 * 
 * action code: 10401
 */
@Getter
@Setter
public class AdminCreateRoleV3 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/admin/roles";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private ModelRoleCreateV3Request body;

    /**
    * @param body required
    */
    @Builder
    public AdminCreateRoleV3(
            ModelRoleCreateV3Request body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
    }

    public AdminCreateRoleV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }




    @Override
    public ModelRoleCreateV3Request getBodyParams(){
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
    public AccountcommonRoleV3 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new AccountcommonRoleV3().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}