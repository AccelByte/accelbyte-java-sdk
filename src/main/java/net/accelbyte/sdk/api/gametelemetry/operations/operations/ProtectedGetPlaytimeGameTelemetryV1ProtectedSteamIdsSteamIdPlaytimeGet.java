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
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * protected_get_playtime_game_telemetry_v1_protected_steamIds__steamId__playtime_get
 *
 * This endpoint requires valid JWT token.
 * This endpoint does not require permission.
 * 
 * This endpoint retrieves player's total playtime in Steam for a specific game (AppId) and store them in service's cache.
 * 
 * Players' Steam account must be set into public to enable the service fetch their total playtime data.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/game-telemetry/v1/protected/steamIds/{steamId}/playtime";

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
    private String steamId;

    /**
    * @param steamId required
    */
    public ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet(
            String steamId
    )
    {
        this.steamId = steamId;
    }

    @JsonIgnore
    public ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet createFromJson(String json) throws JsonProcessingException {
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
        if (this.steamId != null){
            pathParams.put("steamId", this.steamId);
        }
        return pathParams;
    }




    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("steamId","steamId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "steamId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.steamId == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public Integer parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            try (Scanner scanner = new Scanner(json)) {
                String result = scanner.nextLine();
                return Integer.valueOf(result);
            }
        }
        throw new ResponseException(code, json);
    }

}