/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.operations.user_visibility;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.models.ModelsGetUserVisibilityResponse;
import net.accelbyte.sdk.api.leaderboard.models.ModelsSetUserVisibilityRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * SetUserLeaderboardVisibilityStatusV2
 *
 * User with false visibility status will have hidden attribute set to true on it's leaderboard entry
 */
@Getter
@Setter
public class SetUserLeaderboardVisibilityStatusV2 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/leaderboard/v2/admin/namespaces/{namespace}/leaderboards/{leaderboardCode}/users/{userId}/visibility";
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
    private ModelsSetUserVisibilityRequest body;

    /**
    * @param leaderboardCode required
    * @param namespace required
    * @param userId required
    * @param body required
    */
    @Builder
    public SetUserLeaderboardVisibilityStatusV2(
            String leaderboardCode,
            String namespace,
            String userId,
            ModelsSetUserVisibilityRequest body
    )
    {
        this.leaderboardCode = leaderboardCode;
        this.namespace = namespace;
        this.userId = userId;
        this.body = body;
        
        securities.add("Bearer");
    }

    public SetUserLeaderboardVisibilityStatusV2 createFromJson(String json) throws JsonProcessingException {
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
    public ModelsSetUserVisibilityRequest getBodyParams(){
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

    @Override
    public ModelsGetUserVisibilityResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsGetUserVisibilityResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}