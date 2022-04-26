/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.server;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.models.ModelsServerSessionResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * GetServerSession
 *
 * ```
 * Required permission: NAMESPACE:{namespace}:DSM:SERVER [UPDATE]
 * Required scope: social
 * 
 * This endpoint is intended to be called by dedicated server
 * to query its session ID.
 * DS should call this when it first receive player connection,
 * to see if it is actually claimed```
 */
@Getter
@Setter
public class GetServerSession extends Operation {
    /**
     * generated field's value
     */
    private String url = "/dsmcontroller/namespaces/{namespace}/servers/{podName}/session";
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
    private String podName;

    /**
    * @param namespace required
    * @param podName required
    */
    @Builder
    public GetServerSession(
            String namespace,
            String podName
    )
    {
        this.namespace = namespace;
        this.podName = podName;
        
        securities.add("Bearer");
    }

    public GetServerSession createFromJson(String json) throws JsonProcessingException {
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
        if (this.podName != null){
            pathParams.put("podName", this.podName);
        }
        return pathParams;
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
        if(this.podName == null) {
            return false;
        }
        return true;
    }

    public ModelsServerSessionResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsServerSessionResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}