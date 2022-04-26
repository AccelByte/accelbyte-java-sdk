/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.operations.session;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsSessionResponse;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsJoinGameSessionRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * JoinSession
 *
 * Required permission: NAMESPACE:{namespace}:SESSIONBROWSER:SESSION [READ]
 * 
 * Required scope: social
 * 
 * Join the specified session by session ID. Possible the game required a password to join
 */
@Getter
@Setter
public class JoinSession extends Operation {
    /**
     * generated field's value
     */
    private String url = "/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}/join";
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
    private String sessionID;
    private ModelsJoinGameSessionRequest body;

    /**
    * @param namespace required
    * @param sessionID required
    * @param body required
    */
    @Builder
    public JoinSession(
            String namespace,
            String sessionID,
            ModelsJoinGameSessionRequest body
    )
    {
        this.namespace = namespace;
        this.sessionID = sessionID;
        this.body = body;
        
        securities.add("Bearer");
    }

    public JoinSession createFromJson(String json) throws JsonProcessingException {
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
        if (this.sessionID != null){
            pathParams.put("sessionID", this.sessionID);
        }
        return pathParams;
    }



    @Override
    public ModelsJoinGameSessionRequest getBodyParams(){
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
        if(this.sessionID == null) {
            return false;
        }
        return true;
    }

    public ModelsSessionResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsSessionResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}