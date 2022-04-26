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
import net.accelbyte.sdk.api.dsmc.models.ModelsImportResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

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
public class ImportImages extends Operation {
    /**
     * generated field's value
     */
    private String url = "/dsmcontroller/admin/images/import";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("multipart/form-data");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private InputStream file;

    /**
    * @param file required
    */
    @Builder
    public ImportImages(
            InputStream file
    )
    {
        this.file = file;
        
        securities.add("Bearer");
    }





    @Override
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.file != null) {
            formDataParams.put("file", this.file);
        }
        return formDataParams;
    }

    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.file == null) {
            return false;
        }
        return true;
    }

    public ModelsImportResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsImportResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}