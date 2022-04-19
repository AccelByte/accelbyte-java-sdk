/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.deployment_config;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.models.ModelsDeploymentWithOverride;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * DeleteDeploymentOverride
 *
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [DELETE]
 * 
 * Required scope: social
 * 
 * This endpoint delete a dedicated server deployment override in a namespace
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class DeleteDeploymentOverride extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/versions/{version}";

    @JsonIgnore
    private String method = "DELETE";

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
    private String deployment;
    private String namespace;
    private String version;

    /**
    * @param deployment required
    * @param namespace required
    * @param version required
    */
    @Builder
    public DeleteDeploymentOverride(
            String deployment,
            String namespace,
            String version
    )
    {
        this.deployment = deployment;
        this.namespace = namespace;
        this.version = version;
    }

    @JsonIgnore
    public DeleteDeploymentOverride createFromJson(String json) throws JsonProcessingException {
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
        if (this.deployment != null){
            pathParams.put("deployment", this.deployment);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.version != null){
            pathParams.put("version", this.version);
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
        result.put("deployment","deployment");
        result.put("namespace","namespace");
        result.put("version","version");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "deployment",
            "namespace",
            "version"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.deployment == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.version == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ModelsDeploymentWithOverride parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsDeploymentWithOverride().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}