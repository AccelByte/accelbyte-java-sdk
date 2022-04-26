/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.public_channel;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.models.ModelsChannelResponse;
import net.accelbyte.sdk.api.ugc.models.ModelsChannelRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * UpdateChannel
 *
 * Required permission NAMESPACE:{namespace}:USER:{userId}:CHANNEL [UPDATE]
 */
@Getter
@Setter
public class UpdateChannel extends Operation {
    /**
     * generated field's value
     */
    private String url = "/ugc/v1/public/namespaces/{namespace}/users/{userId}/channels/{channelId}";
    private String method = "PUT";
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
    private ModelsChannelRequest body;

    /**
    * @param channelId required
    * @param namespace required
    * @param userId required
    * @param body required
    */
    @Builder
    public UpdateChannel(
            String channelId,
            String namespace,
            String userId,
            ModelsChannelRequest body
    )
    {
        this.channelId = channelId;
        this.namespace = namespace;
        this.userId = userId;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateChannel createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
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
    public ModelsChannelRequest getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
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

    public ModelsChannelResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsChannelResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}