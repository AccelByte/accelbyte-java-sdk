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
import net.accelbyte.sdk.api.iam.models.AccountcommonRole;
import net.accelbyte.sdk.api.iam.models.ModelRoleCreateRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * CreateRole
 *
 * 
 * 
 * Required permission 'ROLE:ADMIN [CREATE]' or 'ADMIN:ROLE [CREATE]'
 * 
 * 
 * 
 * 
 * Required Permission 'ROLE:ADMIN [CREATE]' is going to be DEPRECATED for security purpose.
 * It is going to be deprecated on 31 JANUARY 2019 , please use permission 'ADMIN:ROLE [CREATE]' instead.
 * 
 * 
 * 
 * 
 * Role can only be assigned to other users by the role's manager.
 * 
 * 
 * 
 * 
 * If role is an administrator role (i.e. AdminRole == true), it will list out the role's members.
 * 
 * 
 * 
 * 
 * Administrator role can be created only when at least 1 manager is specified.
 */
@Getter
@Setter
public class CreateRole extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/roles";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private ModelRoleCreateRequest body;

    /**
    * @param body required
    */
    @Builder
    public CreateRole(
            ModelRoleCreateRequest body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
    }

    public CreateRole createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }




    @Override
    public ModelRoleCreateRequest getBodyParams(){
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
    public AccountcommonRole parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new AccountcommonRole().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}