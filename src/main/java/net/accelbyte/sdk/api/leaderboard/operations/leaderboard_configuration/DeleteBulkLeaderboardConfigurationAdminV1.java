/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.models.ModelsDeleteBulkLeaderboardsResp;
import net.accelbyte.sdk.api.leaderboard.models.ModelsDeleteBulkLeaderboardsReq;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * deleteBulkLeaderboardConfigurationAdminV1
 *
 * 
 * 
 * Required permission 'ADMIN:NAMESPACE:{namespace}:LEADERBOARD [DELETE]'
 * 
 * 
 * 
 * 
 * This endpoint delete multiple leaderboards configuration in one request
 */
@Getter
@Setter
public class DeleteBulkLeaderboardConfigurationAdminV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/leaderboard/v1/admin/namespaces/{namespace}/leaderboards/delete";
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
    private ModelsDeleteBulkLeaderboardsReq body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public DeleteBulkLeaderboardConfigurationAdminV1(
            String namespace,
            ModelsDeleteBulkLeaderboardsReq body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public DeleteBulkLeaderboardConfigurationAdminV1 createFromJson(String json) throws JsonProcessingException {
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
    public ModelsDeleteBulkLeaderboardsReq getBodyParams(){
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
    public ModelsDeleteBulkLeaderboardsResp parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsDeleteBulkLeaderboardsResp().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}