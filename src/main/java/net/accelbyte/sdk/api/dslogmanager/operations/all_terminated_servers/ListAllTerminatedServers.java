/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dslogmanager.operations.all_terminated_servers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dslogmanager.models.*;
import net.accelbyte.sdk.api.dslogmanager.models.ModelsListTerminatedServersResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * listAllTerminatedServers
 *
 * ```
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSLM:SERVER [READ]
 * 
 * This endpoint used to retrieve terminated servers in all namespace
 * ```
 */
@Getter
@Setter
public class ListAllTerminatedServers extends Operation {
    /**
     * generated field's value
     */
    private String url = "/dslogmanager/servers/search";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String deployment;
    private String endDate;
    private String gameMode;
    private Integer limit;
    private String namespace;
    private String next;
    private String partyId;
    private String podName;
    private String previous;
    private String provider;
    private String region;
    private String sessionId;
    private String startDate;
    private String userId;

    /**
    */
    @Builder
    public ListAllTerminatedServers(
            String deployment,
            String endDate,
            String gameMode,
            Integer limit,
            String namespace,
            String next,
            String partyId,
            String podName,
            String previous,
            String provider,
            String region,
            String sessionId,
            String startDate,
            String userId
    )
    {
        this.deployment = deployment;
        this.endDate = endDate;
        this.gameMode = gameMode;
        this.limit = limit;
        this.namespace = namespace;
        this.next = next;
        this.partyId = partyId;
        this.podName = podName;
        this.previous = previous;
        this.provider = provider;
        this.region = region;
        this.sessionId = sessionId;
        this.startDate = startDate;
        this.userId = userId;
        
        securities.add("Bearer");
    }

    public ListAllTerminatedServers createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }


    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("deployment", this.deployment == null ? null : Arrays.asList(this.deployment));
        queryParams.put("end_date", this.endDate == null ? null : Arrays.asList(this.endDate));
        queryParams.put("game_mode", this.gameMode == null ? null : Arrays.asList(this.gameMode));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("namespace", this.namespace == null ? null : Arrays.asList(this.namespace));
        queryParams.put("next", this.next == null ? null : Arrays.asList(this.next));
        queryParams.put("party_id", this.partyId == null ? null : Arrays.asList(this.partyId));
        queryParams.put("pod_name", this.podName == null ? null : Arrays.asList(this.podName));
        queryParams.put("previous", this.previous == null ? null : Arrays.asList(this.previous));
        queryParams.put("provider", this.provider == null ? null : Arrays.asList(this.provider));
        queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
        queryParams.put("session_id", this.sessionId == null ? null : Arrays.asList(this.sessionId));
        queryParams.put("start_date", this.startDate == null ? null : Arrays.asList(this.startDate));
        queryParams.put("user_id", this.userId == null ? null : Arrays.asList(this.userId));
        return queryParams;
    }




    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }


    public ModelsListTerminatedServersResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsListTerminatedServersResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("deployment", "None");
        result.put("end_date", "None");
        result.put("game_mode", "None");
        result.put("limit", "None");
        result.put("namespace", "None");
        result.put("next", "None");
        result.put("party_id", "None");
        result.put("pod_name", "None");
        result.put("previous", "None");
        result.put("provider", "None");
        result.put("region", "None");
        result.put("session_id", "None");
        result.put("start_date", "None");
        result.put("user_id", "None");
        return result;
    }
}