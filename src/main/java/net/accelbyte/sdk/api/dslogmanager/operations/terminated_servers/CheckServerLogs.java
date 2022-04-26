/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dslogmanager.operations.terminated_servers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dslogmanager.models.*;
import net.accelbyte.sdk.api.dslogmanager.models.ModelsLogFileStatus;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * checkServerLogs
 *
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSLM:LOG [READ]
 * 
 * Required scope: social
 * 
 * This endpoint will check log file existence before download file.
 */
@Getter
@Setter
public class CheckServerLogs extends Operation {
    /**
     * generated field's value
     */
    private String url = "/dslogmanager/namespaces/{namespace}/servers/{podName}/logs/exists";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json","text/x-log");
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
    public CheckServerLogs(
            String namespace,
            String podName
    )
    {
        this.namespace = namespace;
        this.podName = podName;
        
        securities.add("Bearer");
    }

    public CheckServerLogs createFromJson(String json) throws JsonProcessingException {
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

    public ModelsLogFileStatus parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsLogFileStatus().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}