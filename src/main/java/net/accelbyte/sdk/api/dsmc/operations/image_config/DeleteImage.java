/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.image_config;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * DeleteImage
 *
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [UPDATE]
 * 
 * Required scope: social
 * 
 * This endpoint will delete an image that specified in the request parameter
 */
@Getter
@Setter
public class DeleteImage extends Operation {
    /**
     * generated field's value
     */
    private String url = "/dsmcontroller/admin/namespaces/{namespace}/images";
    private String method = "DELETE";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String imageURI;
    private String version;

    /**
    * @param namespace required
    * @param imageURI required
    * @param version required
    */
    @Builder
    public DeleteImage(
            String namespace,
            String imageURI,
            String version
    )
    {
        this.namespace = namespace;
        this.imageURI = imageURI;
        this.version = version;
        
        securities.add("Bearer");
    }

    public DeleteImage createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("imageURI", this.imageURI == null ? null : Arrays.asList(this.imageURI));
        queryParams.put("version", this.version == null ? null : Arrays.asList(this.version));
        return queryParams;
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
        if(this.imageURI == null) {
            return false;
        }
        if(this.version == null) {
            return false;
        }
        return true;
    }

    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("imageURI", "None");
        result.put("version", "None");
        return result;
    }
}