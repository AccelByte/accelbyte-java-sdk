/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.group.operations.group_roles;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.models.ModelsGetUserGroupInformationResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsAssignRoleToMemberRequestV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

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
@JsonIgnoreProperties(ignoreUnknown = true)
public class UpdateMemberRolePublicV1 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/group/v1/public/namespaces/{namespace}/roles/{memberRoleId}/members";

    @JsonIgnore
    private String method = "POST";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
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
    public UpdateMemberRolePublicV1(
            String memberRoleId,
            String namespace,
            ModelsAssignRoleToMemberRequestV1 body
    )
    {
        this.memberRoleId = memberRoleId;
        this.namespace = namespace;
        this.body = body;
    }

    @JsonIgnore
    public UpdateMemberRolePublicV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
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
    @JsonIgnore
    public ModelsAssignRoleToMemberRequestV1 getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("memberRoleId","memberRoleId");
        result.put("namespace","namespace");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "memberRoleId",
            "namespace"
        );
    }

    @Override
    @JsonIgnore
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
    @JsonIgnore
    public ModelsGetUserGroupInformationResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsGetUserGroupInformationResponseV1().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}