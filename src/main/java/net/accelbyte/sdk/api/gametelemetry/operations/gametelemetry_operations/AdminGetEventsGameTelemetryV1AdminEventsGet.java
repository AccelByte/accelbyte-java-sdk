/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gametelemetry.operations.gametelemetry_operations;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.gametelemetry.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * admin_get_events_game_telemetry_v1_admin_events_get
 *
 * This endpoint requires valid JWT token and permission **ADMIN:ANALYTICS:TELEMETRY:{EventNamespace}** **READ**.
 * 
 * This endpoint retrieve the latest event from each event name on specific namespace.
 * 
 * 
 * 
 * Parameter:
 * 
 * - **Namespace (required) (case-sensitive)**: telemetry namespace.
 * 
 * 
 * Only accept input with valid characters. Allowed characters: Aa-Zz0-9_.-
 * 
 * 
 * 
 * 
 * Example: accelbyte or accelbyte.game2
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminGetEventsGameTelemetryV1AdminEventsGet extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/game-telemetry/v1/admin/events";

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

    /**
    * @param namespace required
    */
    @Builder
    public AdminGetEventsGameTelemetryV1AdminEventsGet(
            String namespace
    )
    {
        this.namespace = namespace;
    }

    @JsonIgnore
    public AdminGetEventsGameTelemetryV1AdminEventsGet createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }


    @Override
    @JsonIgnore
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("namespace", this.namespace == null ? null : Arrays.asList(this.namespace));
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
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 200){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace", "None");
        return result;
    }
}