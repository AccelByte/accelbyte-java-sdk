/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.group_roles;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.models.ModelsCreateMemberRoleResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsCreateMemberRoleRequestV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * createMemberRoleAdminV1
 *
 * 
 * 
 * Required permission ADMIN:NAMESPACE:{namespace}:GROUP:ROLE [CREATE]
 * 
 * 
 * 
 * 
 * This endpoint is used to create new member role
 * 
 * 
 * 
 * 
 * Action Code: 73202
 * 
 * 
 * 
 * 
 * 
 * 
 * memberRolePermissions example value :
 * 
 * 
 * 
 * 
 * "action": 1
 * 
 * 
 * 
 * 
 * "resourceName": "GROUP:ROLE"
 * 
 * 
 * 
 * 
 * The changes will give user with that role have a permission to create a role for new group member
 */
@Getter
@Setter
public class CreateMemberRoleAdminV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/group/v1/admin/namespaces/{namespace}/roles";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private ModelsCreateMemberRoleRequestV1 body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public CreateMemberRoleAdminV1(
            String namespace,
            ModelsCreateMemberRoleRequestV1 body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public CreateMemberRoleAdminV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelsCreateMemberRoleRequestV1 getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelsCreateMemberRoleResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelsCreateMemberRoleResponseV1().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}