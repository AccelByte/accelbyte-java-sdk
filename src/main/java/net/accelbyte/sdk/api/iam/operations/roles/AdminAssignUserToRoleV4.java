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
import net.accelbyte.sdk.api.iam.models.ModelAssignedUserV4Response;
import net.accelbyte.sdk.api.iam.models.ModelAssignUserV4Request;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminAssignUserToRoleV4
 *
 * Required permission ADMIN:ROLE [UPDATE]
 * 
 * Parameters:
 * - userId: string (required)
 * - namespace: string (userâs namespace) (required)
 * - assignedNamespaces: array of string (namespaces to be assigned on role) (required)
 * 
 * action code: 10410
 */
@Getter
@Setter
public class AdminAssignUserToRoleV4 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v4/admin/roles/{roleId}/users";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String roleId;
    private ModelAssignUserV4Request body;

    /**
    * @param roleId required
    * @param body required
    */
    @Builder
    public AdminAssignUserToRoleV4(
            String roleId,
            ModelAssignUserV4Request body
    )
    {
        this.roleId = roleId;
        this.body = body;
        
        securities.add("Bearer");
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
    public ModelAssignUserV4Request getBodyParams(){
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

    public ModelAssignedUserV4Response parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelAssignedUserV4Response().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}