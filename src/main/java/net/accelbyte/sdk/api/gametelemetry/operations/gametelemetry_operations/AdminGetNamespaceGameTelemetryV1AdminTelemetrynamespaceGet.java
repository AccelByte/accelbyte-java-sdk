/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gametelemetry.operations.gametelemetry_operations;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.gametelemetry.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * admin_get_namespace_game_telemetry_v1_admin_telemetrynamespace_get
 *
 * This endpoint requires valid JWT token and permission **ADMIN:ANALYTICS:TELEMETRY:{EventNamespace}** **READ**.
 * 
 * This endpoint retrieve namespace from kafka topic.
 */
@Getter
@Setter
public class AdminGetNamespaceGameTelemetryV1AdminTelemetrynamespaceGet extends Operation {
    /**
     * generated field's value
     */
    private String url = "/game-telemetry/v1/admin/telemetrynamespace";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */

    /**
    */
    @Builder
    public AdminGetNamespaceGameTelemetryV1AdminTelemetrynamespaceGet(
    )
    {
        
        securities.add("Bearer");
        securities.add("Cookie");
    }

    public AdminGetNamespaceGameTelemetryV1AdminTelemetrynamespaceGet createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }



    @Override
    public Map<String, String> getCookieParams(){
        Map<String, String> cookieParams = new HashMap<>();
        return cookieParams;
    }



    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }


    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            String json = this.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}