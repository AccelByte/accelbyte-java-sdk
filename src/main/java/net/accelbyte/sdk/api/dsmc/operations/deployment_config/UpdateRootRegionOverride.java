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
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * UpdateRootRegionOverride
 *
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [UPDATE]
 * 
 * Required scope: social
 * 
 * This endpoint update a dedicated servers deployment override in a namespace in a region for root deployment.
 */
@Getter
@Setter
public class UpdateRootRegionOverride extends Operation {
    /**
     * generated field's value
     */
    private String url = "/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/regions/{region}";
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
    private ModelsUpdateRegionOverrideRequest body;

    /**
    * @param deployment required
    * @param namespace required
    * @param region required
    * @param body required
    */
    @Builder
    public UpdateRootRegionOverride(
            String deployment,
            String namespace,
            String region,
            ModelsUpdateRegionOverrideRequest body
    )
    {
        this.deployment = deployment;
        this.namespace = namespace;
        this.region = region;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateRootRegionOverride createFromJson(String json) throws JsonProcessingException {
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
        return true;
    }

    @Override
    public ModelsDeploymentWithOverride parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsDeploymentWithOverride().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}