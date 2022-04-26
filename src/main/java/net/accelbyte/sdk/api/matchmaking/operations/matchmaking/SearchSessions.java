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
import net.accelbyte.sdk.api.matchmaking.models.ServiceGetSessionHistorySearchResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * SearchSessions
 *
 * Required Permission: ADMIN:NAMESPACE:{namespace}:MATCHMAKING:CHANNEL [Read]
 * 
 * Required Scope: social
 * 
 * Search sessions.
 */
@Getter
@Setter
public class SearchSessions extends Operation {
    /**
     * generated field's value
     */
    private String url = "/matchmaking/v1/admin/namespaces/{namespace}/sessions/history/search";
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
    private String channel;
    private Boolean deleted;
    private String matchID;
    private String partyID;
    private String userID;
    private Integer limit;
    private Integer offset;

    /**
    * @param namespace required
    * @param limit required
    * @param offset required
    */
    @Builder
    public SearchSessions(
            String namespace,
            String channel,
            Boolean deleted,
            String matchID,
            String partyID,
            String userID,
            Integer limit,
            Integer offset
    )
    {
        this.namespace = namespace;
        this.channel = channel;
        this.deleted = deleted;
        this.matchID = matchID;
        this.partyID = partyID;
        this.userID = userID;
        this.limit = limit;
        this.offset = offset;
        
        securities.add("Bearer");
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
        queryParams.put("channel", this.channel == null ? null : Arrays.asList(this.channel));
        queryParams.put("deleted", this.deleted == null ? null : Arrays.asList(String.valueOf(this.deleted)));
        queryParams.put("matchID", this.matchID == null ? null : Arrays.asList(this.matchID));
        queryParams.put("partyID", this.partyID == null ? null : Arrays.asList(this.partyID));
        queryParams.put("userID", this.userID == null ? null : Arrays.asList(this.userID));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
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
        if(this.limit == null) {
            return false;
        }
        if(this.offset == null) {
            return false;
        }
        return true;
    }

    public ServiceGetSessionHistorySearchResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ServiceGetSessionHistorySearchResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("channel", "None");
        result.put("deleted", "None");
        result.put("matchID", "None");
        result.put("partyID", "None");
        result.put("userID", "None");
        result.put("limit", "None");
        result.put("offset", "None");
        return result;
    }
}