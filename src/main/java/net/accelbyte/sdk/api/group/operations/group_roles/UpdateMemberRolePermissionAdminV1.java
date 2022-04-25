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
import net.accelbyte.sdk.api.group.models.ModelsUpdateMemberRoleResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsUpdateMemberRolePermissionsRequestV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updateMemberRolePermissionAdminV1
 *
 * 
 * 
 * Required permission ADMIN:NAMESPACE:{namespace}:GROUP:ROLE [UPDATE]
 * 
 * 
 * 
 * 
 * This endpoint is used to update member role permission. It will replace the existing permission based on the request from this endpoint
 * 
 * 
 * 
 * 
 * Action Code: 73205
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
 * "action": 2
 * 
 * 
 * 
 * 
 * "resourceName": "GROUP:ROLE"
 * 
 * 
 * 
 * 
 * The changes will update user role to be able to read a role of other member
 */
@Getter
@Setter
public class UpdateMemberRolePermissionAdminV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/group/v1/admin/namespaces/{namespace}/roles/{memberRoleId}/permissions";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String memberRoleId;
    private String namespace;
    private ModelsUpdateMemberRolePermissionsRequestV1 body;

    /**
    * @param memberRoleId required
    * @param namespace required
    * @param body required
    */
    @Builder
    public UpdateMemberRolePermissionAdminV1(
            String memberRoleId,
            String namespace,
            ModelsUpdateMemberRolePermissionsRequestV1 body
    )
    {
        this.memberRoleId = memberRoleId;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateMemberRolePermissionAdminV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.memberRoleId != null){
            pathParams.put("memberRoleId", this.memberRoleId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelsUpdateMemberRolePermissionsRequestV1 getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.memberRoleId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsUpdateMemberRoleResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsUpdateMemberRoleResponseV1().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}