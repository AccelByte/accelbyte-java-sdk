/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.config;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.models.ModelsDSMConfigRecord;
import net.accelbyte.sdk.api.dsmc.models.ModelsUpdateDSMConfigRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * UpdateConfig
 *
 * ```
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [UPDATE]
 * Required scope: social
 * 
 * This endpoint modifies config. When there are ready servers and
 * the server version is updated, those servers will be replaced with newer version.
 * 
 * Port is where your game listens for incoming UDP connection, if empty it'll be set to 15000
 * 
 * CPU and Memory limit / request are formatted with Kubernetes format,
 * e.g. CPU of 1000m is 1 core, and Memory of 512Mi is 512 MB.
 * 
 * The creation/claim/session/unreachable/heartbeat timeouts are all in seconds.
 * Creation timeout is time limit for DS to startup until registers itself.
 * Claim timeout is time limit for game session manager to claim its ready DS.
 * Session timeout is time limit for match session before deleted.
 * Unreachable timeout is time limit for DS in UNREACHABLE state before deleted.
 * Heartbeat timeout is time limit for DS to give heartbeat before marked as UNREACHABLE.
 * 
 * Sample config:
 * {
 * "namespace": "accelbyte",
 * "providers": [
 * "aws"
 * ],
 * "port": 7777,
 * "protocol": "udp",
 * "creation_timeout": 120,
 * "claim_timeout": 60,
 * "session_timeout": 1800,
 * "heartbeat_timeout": 30,
 * "unreachable_timeout": 30,
 * }
 * ```
 */
@Getter
@Setter
public class UpdateConfig extends Operation {
    /**
     * generated field's value
     */
    private String url = "/dsmcontroller/admin/namespaces/{namespace}/configs";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private ModelsUpdateDSMConfigRequest body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public UpdateConfig(
            String namespace,
            ModelsUpdateDSMConfigRequest body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
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
    public ModelsUpdateDSMConfigRequest getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsDSMConfigRecord parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsDSMConfigRecord().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}