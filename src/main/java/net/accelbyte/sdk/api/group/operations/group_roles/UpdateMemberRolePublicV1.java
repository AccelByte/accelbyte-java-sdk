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
import net.accelbyte.sdk.api.group.models.ModelsGetUserGroupInformationResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsAssignRoleToMemberRequestV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updateMemberRolePublicV1
 *
 * Required Member Role Permission: "GROUP:ROLE [UPDATE]
 * 
 * 
 * 
 * 
 * This endpoint is used to assign role to group member
 * 
 * 
 * 
 * 
 * Action Code: 73204
 */
@Getter
@Setter
public class UpdateMemberRolePublicV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/group/v1/public/namespaces/{namespace}/roles/{memberRoleId}/members";
    private String method = "POST";
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
    private ModelsAssignRoleToMemberRequestV1 body;

    /**
    * @param memberRoleId required
    * @param namespace required
    * @param body required
    */
    @Builder
    public UpdateMemberRolePublicV1(
            String memberRoleId,
            String namespace,
            ModelsAssignRoleToMemberRequestV1 body
    )
    {
        this.memberRoleId = memberRoleId;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateMemberRolePublicV1 createFromJson(String json) throws JsonProcessingException {
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
    public ModelsAssignRoleToMemberRequestV1 getBodyParams(){
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

    public ModelsGetUserGroupInformationResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsGetUserGroupInformationResponseV1().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}