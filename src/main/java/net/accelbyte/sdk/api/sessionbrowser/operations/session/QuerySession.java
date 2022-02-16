/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.sessionbrowser.operations.session;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class QuerySession extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/sessionbrowser/namespaces/{namespace}/gamesession";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private String namespace;
    private String gameMode;
    private String gameVersion;
    private String joinable;
    private String limit;
    private String matchExist;
    private String matchId;
    private String offset;
    private String serverStatus;
    private String userId;
    private String sessionType;

    /**
    * @param namespace required
    * @param sessionType required
    */
    public QuerySession(
            String namespace,
            String gameMode,
            String gameVersion,
            String joinable,
            String limit,
            String matchExist,
            String matchId,
            String offset,
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
    }

    @JsonIgnore
    public QuerySession createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("game_mode", this.gameMode == null ? null : Arrays.asList(this.gameMode));
        queryParams.put("game_version", this.gameVersion == null ? null : Arrays.asList(this.gameVersion));
        queryParams.put("joinable", this.joinable == null ? null : Arrays.asList(this.joinable));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(this.limit));
        queryParams.put("match_exist", this.matchExist == null ? null : Arrays.asList(this.matchExist));
        queryParams.put("match_id", this.matchId == null ? null : Arrays.asList(this.matchId));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(this.offset));
        queryParams.put("server_status", this.serverStatus == null ? null : Arrays.asList(this.serverStatus));
        queryParams.put("user_id", this.userId == null ? null : Arrays.asList(this.userId));
        queryParams.put("session_type", this.sessionType == null ? null : Arrays.asList(this.sessionType));
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("game_mode","gameMode");
        result.put("game_version","gameVersion");
        result.put("joinable","joinable");
        result.put("limit","limit");
        result.put("match_exist","matchExist");
        result.put("match_id","matchId");
        result.put("offset","offset");
        result.put("server_status","serverStatus");
        result.put("user_id","userId");
        result.put("session_type","sessionType");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",









            "sessionType"
        );
    }

    @Override
    @JsonIgnore
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
    @JsonIgnore
    public ModelsSessionQueryResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsSessionQueryResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
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