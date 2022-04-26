/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.deployment_config;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.models.ModelsDeploymentWithOverride;
import net.accelbyte.sdk.api.dsmc.models.ModelsUpdateRegionOverrideRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * UpdateOverrideRegionOverride
 *
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [UPDATE]
 * 
 * Required scope: social
 * 
 * This endpoint update a dedicated servers deployment override in a namespace in a region for deployment overrides.
 */
@Getter
@Setter
public class UpdateOverrideRegionOverride extends Operation {
    /**
     * generated field's value
     */
    private String url = "/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/versions/{version}/regions/{region}";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String deployment;
    private String namespace;
    private String region;
    private String version;
    private ModelsUpdateRegionOverrideRequest body;

    /**
    * @param deployment required
    * @param namespace required
    * @param region required
    * @param version required
    * @param body required
    */
    @Builder
    public UpdateOverrideRegionOverride(
            String deployment,
            String namespace,
            String region,
            String version,
            ModelsUpdateRegionOverrideRequest body
    )
    {
        this.deployment = deployment;
        this.namespace = namespace;
        this.region = region;
        this.version = version;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateOverrideRegionOverride createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.deployment != null){
            pathParams.put("deployment", this.deployment);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.region != null){
            pathParams.put("region", this.region);
        }
        if (this.version != null){
            pathParams.put("version", this.version);
        }
        return pathParams;
    }



    @Override
    public ModelsUpdateRegionOverrideRequest getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.deployment == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.region == null) {
            return false;
        }
        if(this.version == null) {
            return false;
        }
        return true;
    }

    public ModelsDeploymentWithOverride parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsDeploymentWithOverride().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}