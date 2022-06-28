/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.public_content;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateContentResponse;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateContentRequestS3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * CreateContentS3
 *
 * Required permission NAMESPACE:{namespace}:USER:{userId}:CONTENT [CREATE].
 * 
 * All request body are required except payload, preview, tags, and contentType.
 * contentType values is used to enforce the Content-Type header needed by the client to upload the content using the S3 presigned URL.
 * If not specified, it will use fileExtension value.
 */
@Getter
@Setter
public class CreateContentS3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/ugc/v1/public/namespaces/{namespace}/users/{userId}/channels/{channelId}/contents/s3";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json","application/octet-stream");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String channelId;
    private String namespace;
    private String userId;
    private ModelsCreateContentRequestS3 body;

    /**
    * @param channelId required
    * @param namespace required
    * @param userId required
    * @param body required
    */
    @Builder
    public CreateContentS3(
            String channelId,
            String namespace,
            String userId,
            ModelsCreateContentRequestS3 body
    )
    {
        this.channelId = channelId;
        this.namespace = namespace;
        this.userId = userId;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.channelId != null){
            pathParams.put("channelId", this.channelId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }



    @Override
    public ModelsCreateContentRequestS3 getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.channelId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public ModelsCreateContentResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelsCreateContentResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}