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
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * deleteUserRankingsAdminV1
 *
 * Delete user ranking across leaderboard
 * Required permission: ADMIN:NAMESPACE:{namespace}:LEADERBOARD:USER [DELETE]
 * 
 * Remove entry with provided userId from leaderboard.
 * If leaderboard with given leaderboard code not found, it will return http status not found (404).
 * If the leaderboard is found and no entry found in it, it will still return success (204)
 */
@Getter
@Setter
public class DeleteUserRankingsAdminV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/leaderboard/v1/admin/namespaces/{namespace}/users/{userId}";
    private String method = "DELETE";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String userId;
    private List<String> leaderboardCode;

    /**
    * @param namespace required
    * @param userId required
    * @param leaderboardCode required
    */
    @Builder
    public DeleteUserRankingsAdminV1(
            String namespace,
            String userId,
            List<String> leaderboardCode
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.leaderboardCode = leaderboardCode;
        
        securities.add("Bearer");
    }

    public DeleteUserRankingsAdminV1 createFromJson(String json) throws JsonProcessingException {
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
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("leaderboardCode", this.leaderboardCode == null ? null : this.leaderboardCode);
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
        if(this.userId == null) {
            return false;
        }
        if(this.leaderboardCode == null) {
            return false;
        }
        return true;
    }

    @Override
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("leaderboardCode", "multi");
        return result;
    }
}