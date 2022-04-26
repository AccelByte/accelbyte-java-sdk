/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.operations.matchmaking;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.models.ModelsCreateChannelResponse;
import net.accelbyte.sdk.api.matchmaking.models.ModelsChannelRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * CreateChannelHandler
 *
 * Required Permission: NAMESPACE:{namespace}:MATCHMAKING:CHANNEL [CREATE]
 * 
 * Required Scope: social
 * 
 * Creates a new matchmaking channel.
 * 
 * Matchmaking channels is a list of pool name that is eligible for matchmaking processes.
 * GameMode isolates each matchmaking pools.
 * 
 * If match timeout is set to 0, by default, incoming matchmaking requests will be timed out after 1 hour.
 * 
 * If max worker delay is set to 0, by default, it will wait for at max ~8 seconds during low volume.
 * 
 * Rule Set
 * 
 * Matching Rule used to classify the player. Player that has matched criteria will be grouped together within an ally.
 * 
 * Valid value for criteria is "distance"
 */
@Getter
@Setter
public class CreateChannelHandler extends Operation {
    /**
     * generated field's value
     */
    private String url = "/matchmaking/namespaces/{namespace}/channels";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private ModelsChannelRequest body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public CreateChannelHandler(
            String namespace,
            ModelsChannelRequest body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public CreateChannelHandler createFromJson(String json) throws JsonProcessingException {
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
    public ModelsChannelRequest getBodyParams(){
        return this.body;
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
        return true;
    }

    @Override
    public ModelsCreateChannelResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelsCreateChannelResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}