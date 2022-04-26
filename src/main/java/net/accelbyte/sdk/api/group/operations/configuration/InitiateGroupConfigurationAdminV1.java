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
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * initiateGroupConfigurationAdminV1
 *
 * 
 * 
 * Required permission 'ADMIN:NAMESPACE:{namespace}:GROUP:CONFIGURATION [CREATE]'
 * 
 * 
 * 
 * 
 * This endpoint is used to initiate configuration. This endpoint will automatically create default configuration and member roles with default permission
 * 
 * 
 * 
 * 
 * Default Permission for admin role will cover these permission:
 * 
 * 
 * 
 * 
 * 
 * 
 *   * Permission to invite user to group
 * 
 * 
 *   * Permission to accept or reject join request
 * 
 * 
 *   * Permission to kick group member
 * 
 * 
 * 
 * 
 * 
 * Default max member value will be 50 and global rules will be empty
 * 
 * 
 * 
 * 
 * Action Code: 73104
 */
@Getter
@Setter
public class InitiateGroupConfigurationAdminV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/group/v1/admin/namespaces/{namespace}/configuration/initiate";
    private String method = "POST";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;

    /**
    * @param namespace required
    */
    @Builder
    public InitiateGroupConfigurationAdminV1(
            String namespace
    )
    {
        this.namespace = namespace;
        
        securities.add("Bearer");
    }

    public InitiateGroupConfigurationAdminV1 createFromJson(String json) throws JsonProcessingException {
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