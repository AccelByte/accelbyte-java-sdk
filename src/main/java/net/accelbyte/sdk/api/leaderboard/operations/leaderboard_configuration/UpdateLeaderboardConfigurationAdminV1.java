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
import net.accelbyte.sdk.api.leaderboard.models.ModelsGetLeaderboardConfigResp;
import net.accelbyte.sdk.api.leaderboard.models.ModelsUpdateLeaderboardConfigReq;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updateLeaderboardConfigurationAdminV1
 *
 * 
 * 
 * Required permission 'ADMIN:NAMESPACE:{namespace}:LEADERBOARD [UPDATE]'
 * 
 * 
 * 
 * 
 * Fields :
 * 
 * 
 * 
 * 
 * 
 * 
 *   * Maximum length for leaderboard name is 128 characters.
 * 
 * 
 *   * Start time must be follow RFC3339 standard. e.g. 2020-10-02T15:00:00.05Z
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
 *   * Reset time must be hours:minutes in 24 hours format e.g. 01:30, 10:30, 15:30, 23:15.
 */
@Getter
@Setter
public class UpdateLeaderboardConfigurationAdminV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/leaderboard/v1/admin/namespaces/{namespace}/leaderboards/{leaderboardCode}";
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
    private ModelsUpdateLeaderboardConfigReq body;

    /**
    * @param leaderboardCode required
    * @param namespace required
    * @param body required
    */
    @Builder
    public UpdateLeaderboardConfigurationAdminV1(
            String leaderboardCode,
            String namespace,
            ModelsUpdateLeaderboardConfigReq body
    )
    {
        this.leaderboardCode = leaderboardCode;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
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
    public ModelsUpdateLeaderboardConfigReq getBodyParams(){
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
        return true;
    }

    public ModelsGetLeaderboardConfigResp parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsGetLeaderboardConfigResp().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}