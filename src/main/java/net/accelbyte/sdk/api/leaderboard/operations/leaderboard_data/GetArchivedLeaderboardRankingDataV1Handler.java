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
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * GetArchivedLeaderboardRankingDataV1Handler
 *
 * 
 * 
 * Get signed url in an all time leaderboard that archived. NOTE: This will be a bulk endpoint to get sign url
 */
@Getter
@Setter
public class GetArchivedLeaderboardRankingDataV1Handler extends Operation {
    /**
     * generated field's value
     */
    private String url = "/leaderboard/v1/public/namespaces/{namespace}/leaderboards/{leaderboardCode}/archived";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String leaderboardCode;
    private String namespace;
    private String slug;
    private String leaderboardCodes;

    /**
    * @param leaderboardCode required
    * @param namespace required
    * @param leaderboardCodes required
    */
    @Builder
    public GetArchivedLeaderboardRankingDataV1Handler(
            String leaderboardCode,
            String namespace,
            String slug,
            String leaderboardCodes
    )
    {
        this.leaderboardCode = leaderboardCode;
        this.namespace = namespace;
        this.slug = slug;
        this.leaderboardCodes = leaderboardCodes;
        
        securities.add("Bearer");
    }

    public GetArchivedLeaderboardRankingDataV1Handler createFromJson(String json) throws JsonProcessingException {
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
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("slug", this.slug == null ? null : Arrays.asList(this.slug));
        queryParams.put("leaderboardCodes", this.leaderboardCodes == null ? null : Arrays.asList(this.leaderboardCodes));
        return queryParams;
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
        if(this.leaderboardCodes == null) {
            return false;
        }
        return true;
    }

    @Override
    public List<ModelsArchiveLeaderboardSignedURLResponse> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<ModelsArchiveLeaderboardSignedURLResponse>>() {});
        }
        throw new ResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("slug", "None");
        result.put("leaderboardCodes", "None");
        return result;
    }
}