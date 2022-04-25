/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.admin_content;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateScreenshotResponse;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateScreenshotRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminUploadContentScreenshot
 *
 * Required permission ADMIN:NAMESPACE:{namespace}:USER:{userId}:CONTENT [CREATE].
 * 
 * All request body are required except for contentType field.
 * contentType values is used to enforce the Content-Type header needed by the client to upload the content using the presigned URL.
 * If not specified, it will use fileExtension value.
 * Supported file extensions: pjp, jpg, jpeg, jfif, bmp, png.
 * 
 * Maximum description length: 1024.
 */
@Getter
@Setter
public class AdminUploadContentScreenshot extends Operation {
    /**
     * generated field's value
     */
    private String url = "/ugc/v1/admin/namespaces/{namespace}/contents/{contentId}/screenshots";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String contentId;
    private String namespace;
    private ModelsCreateScreenshotRequest body;

    /**
    * @param contentId required
    * @param namespace required
    * @param body required
    */
    @Builder
    public AdminUploadContentScreenshot(
            String contentId,
            String namespace,
            ModelsCreateScreenshotRequest body
    )
    {
        this.contentId = contentId;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public AdminUploadContentScreenshot createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.contentId != null){
            pathParams.put("contentId", this.contentId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelsCreateScreenshotRequest getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.contentId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsCreateScreenshotResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelsCreateScreenshotResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}