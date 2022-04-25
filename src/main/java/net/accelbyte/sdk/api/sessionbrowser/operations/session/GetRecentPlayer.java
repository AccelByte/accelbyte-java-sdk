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
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsRecentPlayerQueryResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * GetRecentPlayer
 *
 * Required permission: NAMESPACE:{namespace}:SESSIONBROWSER:RECENTPLAYER [READ]
 * 
 * Required scope: social
 * 
 * Query recent player by user ID
 */
@Getter
@Setter
public class GetRecentPlayer extends Operation {
    /**
     * generated field's value
     */
    private String url = "/sessionbrowser/namespaces/{namespace}/recentplayer/{userID}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String userID;

    /**
    * @param namespace required
    * @param userID required
    */
    @Builder
    public GetRecentPlayer(
            String namespace,
            String userID
    )
    {
        this.namespace = namespace;
        this.userID = userID;
        
        securities.add("Bearer");
    }

    public GetRecentPlayer createFromJson(String json) throws JsonProcessingException {
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
        if (this.userID != null){
            pathParams.put("userID", this.userID);
        }
        return pathParams;
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
        if(this.userID == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsRecentPlayerQueryResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsRecentPlayerQueryResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}