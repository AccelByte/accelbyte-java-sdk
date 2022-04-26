/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.models.ModelsUpdateUserPointAdminV1Response;
import net.accelbyte.sdk.api.leaderboard.models.ModelsUpdateUserPointAdminV1Request;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updateUserPointAdminV1
 *
 * 
 * 
 * Update user point in a leaderboard. This endpoint uses for test utility only.
 * 
 * 
 * 
 * 
 * Other detail info:
 * 
 * 
 * 
 * 
 * 
 * 
 *   * Required permission: resource="ADMIN:NAMESPACE:{namespace}:USER:(userId):LEADERBOARD", action=4 (UPDATE)
 * 
 * 
 *   * Returns: user ranking
 */
@Getter
@Setter
public class UpdateUserPointAdminV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/leaderboard/v1/admin/namespaces/{namespace}/leaderboards/{leaderboardCode}/users/{userId}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String leaderboardCode;
    private String namespace;
    private String userId;
    private ModelsUpdateUserPointAdminV1Request body;

    /**
    * @param leaderboardCode required
    * @param namespace required
    * @param userId required
    * @param body required
    */
    @Builder
    public UpdateUserPointAdminV1(
            String leaderboardCode,
            String namespace,
            String userId,
            ModelsUpdateUserPointAdminV1Request body
    )
    {
        this.leaderboardCode = leaderboardCode;
        this.namespace = namespace;
        this.userId = userId;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateUserPointAdminV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.leaderboardCode != null){
            pathParams.put("leaderboardCode", this.leaderboardCode);
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
    public ModelsUpdateUserPointAdminV1Request getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.leaderboardCode == null) {
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

    public ModelsUpdateUserPointAdminV1Response parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsUpdateUserPointAdminV1Response().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}