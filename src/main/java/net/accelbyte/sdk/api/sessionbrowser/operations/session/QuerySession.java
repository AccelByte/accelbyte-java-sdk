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
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsSessionQueryResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * QuerySession
 *
 * Required permission: NAMESPACE:{namespace}:SESSIONBROWSER:SESSION [READ]
 * 
 * Required scope: social
 * 
 * Query available game session
 */
@Getter
@Setter
public class QuerySession extends Operation {
    /**
     * generated field's value
     */
    private String url = "/sessionbrowser/namespaces/{namespace}/gamesession";
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
    private String gameMode;
    private String gameVersion;
    private String joinable;
    private Integer limit;
    private String matchExist;
    private String matchId;
    private Integer offset;
    private String serverStatus;
    private String userId;
    private String sessionType;

    /**
    * @param namespace required
    * @param sessionType required
    */
    @Builder
    public QuerySession(
            String namespace,
            String gameMode,
            String gameVersion,
            String joinable,
            Integer limit,
            String matchExist,
            String matchId,
            Integer offset,
            String serverStatus,
            String userId,
            String sessionType
    )
    {
        this.namespace = namespace;
        this.gameMode = gameMode;
        this.gameVersion = gameVersion;
        this.joinable = joinable;
        this.limit = limit;
        this.matchExist = matchExist;
        this.matchId = matchId;
        this.offset = offset;
        this.serverStatus = serverStatus;
        this.userId = userId;
        this.sessionType = sessionType;
        
        securities.add("Bearer");
    }

    public QuerySession createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("game_mode", this.gameMode == null ? null : Arrays.asList(this.gameMode));
        queryParams.put("game_version", this.gameVersion == null ? null : Arrays.asList(this.gameVersion));
        queryParams.put("joinable", this.joinable == null ? null : Arrays.asList(this.joinable));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("match_exist", this.matchExist == null ? null : Arrays.asList(this.matchExist));
        queryParams.put("match_id", this.matchId == null ? null : Arrays.asList(this.matchId));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("server_status", this.serverStatus == null ? null : Arrays.asList(this.serverStatus));
        queryParams.put("user_id", this.userId == null ? null : Arrays.asList(this.userId));
        queryParams.put("session_type", this.sessionType == null ? null : Arrays.asList(this.sessionType));
        return queryParams;
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
        if(this.sessionType == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsSessionQueryResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsSessionQueryResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("game_mode", "None");
        result.put("game_version", "None");
        result.put("joinable", "None");
        result.put("limit", "None");
        result.put("match_exist", "None");
        result.put("match_id", "None");
        result.put("offset", "None");
        result.put("server_status", "None");
        result.put("user_id", "None");
        result.put("session_type", "None");
        return result;
    }
}