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
import net.accelbyte.sdk.api.gametelemetry.models.TelemetryBody;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * protected_save_events_game_telemetry_v1_protected_events_post
 *
 * This endpoint requires valid JWT token.
 * This endpoint does not require permission.
 * 
 * This endpoint send events into designated streaming pipeline and each request can contain single or multiple events.
 * 
 * 
 * Format of the event:
 * 
 * - **EventNamespace (required)**: namespace of the relevant game with domain name format.
 * 
 * 
 * Only accept input with valid characters. Allowed characters: Aa-Zz0-9_.-
 * 
 * 
 * 
 * 
 * It is encouraged to use alphanumeric only characters. _.- will be deprecated soon
 * 
 * 
 * 
 * 
 * Example: io.accelbyte.justice.dev.samplegame
 * 
 * 
 * 
 * - **EventName (required)**: name of the event.
 * 
 * 
 * Only accept input with valid characters. Allowed characters: Aa-Zz0-9_.-
 * 
 * 
 * 
 * 
 * It is encouraged to use alphanumeric only characters. _.- will be deprecated soon
 * 
 * 
 * 
 * 
 * Example: player_killed, mission_accomplished
 * 
 * 
 * 
 * - **Payload (required)**: an arbitrary json with the payload of the said event
 */
@Getter
@Setter
public class ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost extends Operation {
    /**
     * generated field's value
     */
    private String url = "/game-telemetry/v1/protected/events";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private List<TelemetryBody> body;

    /**
    * @param body required
    */
    @Builder
    public ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost(
            List<TelemetryBody> body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
        securities.add("Cookie");
    }

    public ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost createFromJson(String json) throws JsonProcessingException {
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
    public List<TelemetryBody> getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        return true;
    }

    @Override
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}