/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.group.operations.configuration;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * deleteGroupConfigurationV1
 *
 * 
 * 
 * Required permission 'ADMIN:NAMESPACE:{namespace}:GROUP:CONFIGURATION [DELETE]'
 * 
 * 
 * 
 * 
 * This endpoint is used to delete group configuration. This Configuration is used to be the main rule of the service. Each namespace will have its own configuration
 * 
 * 
 * 
 * 
 * Action Code: 73101
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class DeleteGroupConfigurationV1 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/group/v1/admin/namespaces/{namespace}/configuration/{configurationCode}";

    @JsonIgnore
    private String method = "DELETE";

    @JsonIgnore
    private List<String> consumes = Arrays.asList();

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
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
    public DeleteGroupConfigurationV1(
            String configurationCode,
            String namespace
    )
    {
        this.configurationCode = configurationCode;
        this.namespace = namespace;
    }

    @JsonIgnore
    public DeleteGroupConfigurationV1 createFromJson(String json) throws JsonProcessingException {
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
        if (this.configurationCode != null){
            pathParams.put("configurationCode", this.configurationCode);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }




    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("configurationCode","configurationCode");
        result.put("namespace","namespace");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "configurationCode",
            "namespace"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.configurationCode == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}