/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.dsmc.operations.image_config;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * DeleteImagePatch
 *
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [UPDATE]
 * 
 * Required scope: social
 * 
 * This endpoint will delete an image patch that specified in the request parameter
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class DeleteImagePatch extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/dsmcontroller/admin/namespaces/{namespace}/images/patches";

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
    private String namespace;
    private String imageURI;
    private String version;
    private String versionPatch;

    /**
    * @param namespace required
    * @param imageURI required
    * @param version required
    * @param versionPatch required
    */
    @Builder
    public DeleteImagePatch(
            String namespace,
            String imageURI,
            String version,
            String versionPatch
    )
    {
        this.namespace = namespace;
        this.imageURI = imageURI;
        this.version = version;
        this.versionPatch = versionPatch;
    }

    @JsonIgnore
    public DeleteImagePatch createFromJson(String json) throws JsonProcessingException {
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
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("imageURI", this.imageURI == null ? null : Arrays.asList(this.imageURI));
        queryParams.put("version", this.version == null ? null : Arrays.asList(this.version));
        queryParams.put("versionPatch", this.versionPatch == null ? null : Arrays.asList(this.versionPatch));
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("imageURI","imageURI");
        result.put("version","version");
        result.put("versionPatch","versionPatch");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "imageURI",
            "version",
            "versionPatch"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.imageURI == null) {
            return false;
        }
        if(this.version == null) {
            return false;
        }
        if(this.versionPatch == null) {
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

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("imageURI", "None");
        result.put("version", "None");
        result.put("versionPatch", "None");
        return result;
    }
}