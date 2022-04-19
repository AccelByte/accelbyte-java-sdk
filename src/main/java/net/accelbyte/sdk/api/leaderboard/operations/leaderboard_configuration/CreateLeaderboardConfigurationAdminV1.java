/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.models.ModelsLeaderboardConfigReq;
import net.accelbyte.sdk.api.leaderboard.models.ModelsLeaderboardConfigReq;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * createLeaderboardConfigurationAdminV1
 *
 * 
 * 
 * Required permission 'ADMIN:NAMESPACE:{namespace}:LEADERBOARD [CREATE]'
 * 
 * 
 * 
 * 
 * Fields :
 * 
 * 
 * 
 * 
 *   * LeaderboardConfig code must be lowercase and maximum length is 48 characters. (required).
 * 
 * 
 *   * Maximum length for leaderboard name is 128 characters. (required).
 * 
 * 
 *   * Start time must be follow RFC3339 standard. e.g. 2020-10-02T15:00:00.05Z (required).
 * 
 * 
 *   * Season period must be greater than 31 days.
 * 
 * 
 *   * If seasonPeriod is filled, the LeaderboardConfig would have seasonal leaderboard.
 * 
 * 
 *   * Reset Date must be a number 1 - 31. Default is '1'.
 * 
 * 
 *   * Reset Day must be a number 0 - 6. 0 = Sunday, 1 = Monday, 2 = Tuesday, 3 = Wednesday, 4 = Thursday, 5 = Friday, 6 = Saturday (day of week). Default is '0'.
 * 
 * 
 *   * Reset time must be hours:minutes in 24 hours format e.g. 01:30, 10:30, 15:30, 23:15.Default is '00:00'.
 * 
 * 
 *   * Stat Code is related with statistic code in statistic service. (required).
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class CreateLeaderboardConfigurationAdminV1 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/leaderboard/v1/admin/namespaces/{namespace}/leaderboards";

    @JsonIgnore
    private String method = "POST";

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
    private ModelsLeaderboardConfigReq body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public CreateLeaderboardConfigurationAdminV1(
            String namespace,
            ModelsLeaderboardConfigReq body
    )
    {
        this.namespace = namespace;
        this.body = body;
    }

    @JsonIgnore
    public CreateLeaderboardConfigurationAdminV1 createFromJson(String json) throws JsonProcessingException {
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
    public ModelsLeaderboardConfigReq getBodyParams(){
        return this.body;
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
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ModelsLeaderboardConfigReq parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelsLeaderboardConfigReq().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}