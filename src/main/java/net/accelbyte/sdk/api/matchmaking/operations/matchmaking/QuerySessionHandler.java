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
import net.accelbyte.sdk.api.matchmaking.models.ModelsMatchmakingResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * QuerySessionHandler
 *
 * Required Permission: NAMESPACE:{namespace}:SESSION [READ]
 * 
 * Required Scope: social
 * 
 * Queries the specified session's status. Game servers are expected to
 * call this periodically as long as it has a session in queue to see
 * if there are new players being matched to the session.
 * 
 * Possible session statuses are "sessionInQueue", "sessionFull", and "sessionTimeout".
 */
@Getter
@Setter
public class QuerySessionHandler extends Operation {
    /**
     * generated field's value
     */
    private String url = "/matchmaking/namespaces/{namespace}/sessions/{matchID}/status";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String matchID;
    private String namespace;

    /**
    * @param matchID required
    * @param namespace required
    */
    @Builder
    public QuerySessionHandler(
            String matchID,
            String namespace
    )
    {
        this.matchID = matchID;
        this.namespace = namespace;
        
        securities.add("Bearer");
    }

    public QuerySessionHandler createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.matchID != null){
            pathParams.put("matchID", this.matchID);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }





    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.matchID == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsMatchmakingResult parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsMatchmakingResult().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}