/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.qosm.operations.public_;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.qosm.models.*;
import net.accelbyte.sdk.api.qosm.models.ModelsListServerResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

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
public class ListServer extends Operation {
    /**
     * generated field's value
     */
    private String url = "/qosm/public/qos";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
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
    public ListServer(
    )
    {
        
        securities.add("Bearer");
    }

    public ListServer createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }






    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }


    public ModelsListServerResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsListServerResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}