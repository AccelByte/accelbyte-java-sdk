/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.gametelemetry.operations.operations;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * Example: player_killed, mission_accomplished
 * 
 * 
 * 
 * - **Payload (required)**: an arbitrary json with the payload of the said event
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/game-telemetry/v1/protected/events";

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
    private List<TelemetryBody> body;

    /**
    * @param body required
    */
    public ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost(
            List<TelemetryBody> body
    )
    {
        this.body = body;
    }

    @JsonIgnore
    public ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }



    @Override
    @JsonIgnore
    public List<TelemetryBody> getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }


    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        return true;
    }

    @Override
    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}