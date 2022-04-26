/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.configuration;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.models.ModelsCreateGroupConfigurationResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsCreateGroupConfigurationRequestV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * createGroupConfigurationAdminV1
 *
 * 
 * 
 * Required permission 'ADMIN:NAMESPACE:{namespace}:GROUP:CONFIGURATION [CREATE]'
 * 
 * 
 * 
 * 
 * This endpoint is used to create new configuration. Before creating the configuration, make sure that member role for admin and group member are already created before.
 * 
 * 
 * 
 * 
 * For each of the global rule, it will be the rule detail that consists of these fields:
 * 
 * 
 * 
 * 
 * 
 * 
 *   * ruleAttribute : attribute of the player that needs to be checked
 * 
 * 
 *   * ruleCriteria : criteria of the value. The value will be in enum of EQUAL, MINIMUM, MAXIMUM
 * 
 * 
 *   * ruleValue : value that needs to be checked
 * 
 * 
 * 
 * 
 * 
 * Allowed Action can only be filled with any available action in the Group Service. For the configuration, the only value is "createGroup"
 * 
 * 
 * 
 * 
 * Action Code: 73103
 */
@Getter
@Setter
public class CreateGroupConfigurationAdminV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/group/v1/admin/namespaces/{namespace}/configuration";
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
    private ModelsCreateGroupConfigurationRequestV1 body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public CreateGroupConfigurationAdminV1(
            String namespace,
            ModelsCreateGroupConfigurationRequestV1 body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public CreateGroupConfigurationAdminV1 createFromJson(String json) throws JsonProcessingException {
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
    public ModelsCreateGroupConfigurationRequestV1 getBodyParams(){
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

    public ModelsCreateGroupConfigurationResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelsCreateGroupConfigurationResponseV1().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}