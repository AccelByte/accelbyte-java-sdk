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
import net.accelbyte.sdk.api.dsmc.models.ModelsImageRecordUpdate;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * UpdateImage
 *
 * ```
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [UPDATE]
 * Required scope: social
 * 
 * This endpoint will update an image name and/or image persistent flag.
 * 
 * Sample image:
 * {
 * "namespace":"dewa",
 * "version":"1.0.0",
 * "image":"144436415367.dkr.ecr.us-west-2.amazonaws.com/dewa:1.0.0",
 * "persistent":false
 * }
 * ```
 */
@Getter
@Setter
public class UpdateImage extends Operation {
    /**
     * generated field's value
     */
    private String url = "/dsmcontroller/admin/images";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private ModelsImageRecordUpdate body;

    /**
    * @param body required
    */
    @Builder
    public UpdateImage(
            ModelsImageRecordUpdate body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateImage createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }




    @Override
    public ModelsImageRecordUpdate getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        return true;
    }

    @Override
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}