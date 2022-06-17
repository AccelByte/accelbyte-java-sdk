/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.qosm.operations.public_;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.qosm.models.*;
import net.accelbyte.sdk.api.qosm.models.ModelsListServerResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * ListServerPerNamespace
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
public class ListServerPerNamespace extends Operation {
    /**
     * generated field's value
     */
    private String path = "/qosm/public/namespaces/{namespace}/qos";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String status;

    /**
    * @param namespace required
    */
    @Builder
    public ListServerPerNamespace(
            String namespace,
            String status
    )
    {
        this.namespace = namespace;
        this.status = status;
        
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelsListServerResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsListServerResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("status", "None");
        return result;
    }
}