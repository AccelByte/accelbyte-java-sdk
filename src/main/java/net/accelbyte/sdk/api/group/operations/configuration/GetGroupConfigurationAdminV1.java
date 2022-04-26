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
import net.accelbyte.sdk.api.group.models.ModelsGetGroupConfigurationResponseV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * getGroupConfigurationAdminV1
 *
 * 
 * 
 * Required permission 'ADMIN:NAMESPACE:{namespace}:GROUP:CONFIGURATION [READ]'
 * 
 * 
 * 
 * 
 * This endpoint is used to get existing configuration. This Configuration is used as the main rule of the service. Each namespace will have its own configuration
 * 
 * 
 * 
 * 
 * Action Code: 73101
 */
@Getter
@Setter
public class GetGroupConfigurationAdminV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/group/v1/admin/namespaces/{namespace}/configuration/{configurationCode}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String configurationCode;
    private String namespace;

    /**
    * @param configurationCode required
    * @param namespace required
    */
    @Builder
    public GetGroupConfigurationAdminV1(
            String configurationCode,
            String namespace
    )
    {
        this.configurationCode = configurationCode;
        this.namespace = namespace;
        
        securities.add("Bearer");
    }

    public GetGroupConfigurationAdminV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.configurationCode != null){
            pathParams.put("configurationCode", this.configurationCode);
        }
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
        if(this.configurationCode == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelsGetGroupConfigurationResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsGetGroupConfigurationResponseV1().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}