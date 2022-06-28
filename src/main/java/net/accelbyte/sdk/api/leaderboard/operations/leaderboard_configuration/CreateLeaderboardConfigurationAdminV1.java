/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.models.ModelsLeaderboardConfigReq;
import net.accelbyte.sdk.api.leaderboard.models.ModelsLeaderboardConfigReq;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
public class CreateLeaderboardConfigurationAdminV1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/leaderboard/v1/admin/namespaces/{namespace}/leaderboards";
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
    public ModelsLeaderboardConfigReq getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelsLeaderboardConfigReq parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelsLeaderboardConfigReq().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}