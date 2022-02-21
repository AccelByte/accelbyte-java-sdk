/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.qosm.operations.public_;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.qosm.models.*;
import net.accelbyte.sdk.api.qosm.models.ModelsListServerResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * ListServer
 *
 * ```
 * This endpoint lists all QoS services available in all regions.
 * 
 * This endpoint is intended to be called by game client to find out all available regions.
 * After getting a list of QoS on each region, game client is expected to ping each one with UDP
 * connection as described below:
 * 
 * 1. Make UDP connection to each QoS's IP:Port
 * 2. Send string "PING" after connection established
 * 3. Wait for string "PONG" response
 * 4. Note the request-response latency for each QoS in each region
 * 
 * The game then can use ping latency information to either:
 * 1. Inform the player on these latencies and let player choose preferred region
 * 2. Send the latency list to Matchmaking Service so that player can be matched with other players
 * in nearby regions
 * ```
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class ListServer extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/qosm/public/qos";

    @JsonIgnore
    private String method = "GET";

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

    /**
    */
    @Builder
    public ListServer(
    )
    {
    }

    @JsonIgnore
    public ListServer createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }





    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }



    @Override
    @JsonIgnore
    public ModelsListServerResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsListServerResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}