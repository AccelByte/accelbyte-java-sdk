/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.group;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.models.ModelsGroupResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsUpdateGroupPredefinedRuleRequestV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updateGroupPredefinedRulePublicV1
 *
 * 
 * 
 * Required valid user authentication
 * 
 * 
 * 
 * 
 * Required Member Role Permission: "GROUP [UPDATE]"
 * 
 * 
 * 
 * 
 * Update predefined group rule. This endpoint will check the group ID of the user based on the access token
 * and compare it with the group ID in path parameter. It will also check the member role of the user based on
 * the access token
 * 
 * 
 * 
 * 
 * If the rule action is not defined in the group, it will be added immediately to the predefined group rule
 * 
 * 
 * 
 * 
 * Action Code: 73310
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class UpdateGroupPredefinedRulePublicV1 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/group/v1/public/namespaces/{namespace}/groups/{groupId}/rules/defined/{allowedAction}";

    @JsonIgnore
    private String method = "PUT";

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
    private String allowedAction;
    private String groupId;
    private String namespace;
    private ModelsUpdateGroupPredefinedRuleRequestV1 body;

    /**
    * @param allowedAction required
    * @param groupId required
    * @param namespace required
    * @param body required
    */
    @Builder
    public UpdateGroupPredefinedRulePublicV1(
            String allowedAction,
            String groupId,
            String namespace,
            ModelsUpdateGroupPredefinedRuleRequestV1 body
    )
    {
        this.allowedAction = allowedAction;
        this.groupId = groupId;
        this.namespace = namespace;
        this.body = body;
    }

    @JsonIgnore
    public UpdateGroupPredefinedRulePublicV1 createFromJson(String json) throws JsonProcessingException {
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
        if (this.allowedAction != null){
            pathParams.put("allowedAction", this.allowedAction);
        }
        if (this.groupId != null){
            pathParams.put("groupId", this.groupId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public ModelsUpdateGroupPredefinedRuleRequestV1 getBodyParams(){
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
        result.put("allowedAction","allowedAction");
        result.put("groupId","groupId");
        result.put("namespace","namespace");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "allowedAction",
            "groupId",
            "namespace"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.allowedAction == null) {
            return false;
        }
        if(this.groupId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ModelsGroupResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsGroupResponseV1().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}