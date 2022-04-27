/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.qosm.operations.server;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.qosm.models.*;
import net.accelbyte.sdk.api.qosm.models.ModelsHeartbeatRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * Heartbeat
 *
 * ```
 * Required permission: QOS:SERVER [CREATE][UPDATE]
 * Required scope: social
 * 
 * This endpoint is intended to be called by QoS service
 * to register and periodically let QoS Manager know that it is still alive.
 * ```
 */
@Getter
@Setter
public class Heartbeat extends Operation {
    /**
     * generated field's value
     */
    private String path = "/qosm/servers/heartbeat";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private ModelsHeartbeatRequest body;

    /**
    * @param body required
    */
    @Builder
    public Heartbeat(
            ModelsHeartbeatRequest body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
    }




    @Override
    public ModelsHeartbeatRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        return true;
    }

    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 204){
            String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}