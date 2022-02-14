package net.accelbyte.sdk.api.dsmc.operations.deployment_config;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [UPDATE] Required
 * scope: social This endpoint update a dedicated servers deployment override in
 * a namespace in a region for root deployment.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class UpdateRootRegionOverride extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/regions/{region}";

    @JsonIgnore
    private String method = "PATCH";

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
    private String region;
    private ModelsUpdateRegionOverrideRequest body;

    /**
    * @param deployment required
    * @param namespace required
    * @param region required
    * @param body required
    */
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
    }

    @JsonIgnore
    public UpdateRootRegionOverride createFromJson(String json) throws JsonProcessingException {
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
        if (this.region != null){
            pathParams.put("region", this.region);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public ModelsUpdateRegionOverrideRequest getBodyParams(){
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
        result.put("deployment","deployment");
        result.put("namespace","namespace");
        result.put("region","region");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "deployment",
            "namespace",
            "region"
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
        if(this.region == null) {
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