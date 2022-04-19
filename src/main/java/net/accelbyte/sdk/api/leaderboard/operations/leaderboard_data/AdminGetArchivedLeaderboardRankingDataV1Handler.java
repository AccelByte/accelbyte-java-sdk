/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
 * AdminGetArchivedLeaderboardRankingDataV1Handler
 *
 * 
 * 
 * Admin Get signed url in an all time leaderboard that archived. Notes: This will be a bulk endpoint to get sign url
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminGetArchivedLeaderboardRankingDataV1Handler extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/leaderboard/v1/admin/namespaces/{namespace}/leaderboards/archived";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList();

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
    private String slug;
    private String leaderboardCodes;

    /**
    * @param namespace required
    * @param leaderboardCodes required
    */
    @Builder
    public AdminGetArchivedLeaderboardRankingDataV1Handler(
            String namespace,
            String slug,
            String leaderboardCodes
    )
    {
        this.namespace = namespace;
        this.slug = slug;
        this.leaderboardCodes = leaderboardCodes;
    }

    @JsonIgnore
    public AdminGetArchivedLeaderboardRankingDataV1Handler createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("slug", this.slug == null ? null : Arrays.asList(this.slug));
        queryParams.put("leaderboardCodes", this.leaderboardCodes == null ? null : Arrays.asList(this.leaderboardCodes));
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
        result.put("slug","slug");
        result.put("leaderboardCodes","leaderboardCodes");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",

            "leaderboardCodes"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.leaderboardCodes == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public List<ModelsArchiveLeaderboardSignedURLResponse> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<ModelsArchiveLeaderboardSignedURLResponse>>() {});
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("slug", "None");
        result.put("leaderboardCodes", "None");
        return result;
    }
}