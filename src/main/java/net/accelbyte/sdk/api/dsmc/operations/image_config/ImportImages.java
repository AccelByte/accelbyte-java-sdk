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
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.models.ModelsImportResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * ImportImages
 *
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [CREATE]
 * 
 * Required scope: social
 * 
 * This endpoint import a dedicated servers images in a namespace.
 * 
 * The image will be upsert. Existing version will be replaced with imported image, will create new one if not found.
 * 
 * Example data inside imported file
 * [
 * {
 * "namespace": "dewa",
 * "image": "123456789.dkr.ecr.us-west-2.amazonaws.com/ds-dewa:0.0.1-alpha",
 * "version": "0.0.1",
 * "persistent": true
 * }
 * ]
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class ImportImages extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/dsmcontroller/admin/images/import";

    @JsonIgnore
    private String method = "POST";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("multipart/form-data");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private InputStream file;

    /**
    * @param file required
    */
    public ImportImages(
            InputStream file
    )
    {
        this.file = file;
    }

    @JsonIgnore
    public ImportImages createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }




    @Override
    @JsonIgnore
    public Map<String, Object> getFormDataParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.file != null) {
            formDataParams.put("file", this.file);
        }
        return formDataParams;
    }

    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("file","file");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "file"        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.file == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ModelsImportResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsImportResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}