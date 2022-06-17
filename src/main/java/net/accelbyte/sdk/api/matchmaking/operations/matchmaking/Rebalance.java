/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.operations.matchmaking;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.models.ModelsRebalanceResponse;
import net.accelbyte.sdk.api.matchmaking.models.ModelsRebalanceRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * Rebalance
 *
 * Required Permission: NAMESPACE:{namespace}:MATCHMAKING:REBALANCE [Update]
 * 
 * Required Scope: social
 * 
 * Do rebalance the teams based on MMR from given matchID,
 * consider attribute name "mmr" (case-insensitive),
 * or any first attribute with criteria "distance"
 * 
 * Will return rebalanced mm result
 */
@Getter
@Setter
public class Rebalance extends Operation {
    /**
     * generated field's value
     */
    private String path = "/matchmaking/namespaces/{namespace}/rebalance";
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
    private ModelsRebalanceRequest body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public Rebalance(
            String namespace,
            ModelsRebalanceRequest body
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
    public ModelsRebalanceRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelsRebalanceResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsRebalanceResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}