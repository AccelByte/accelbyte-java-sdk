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
import net.accelbyte.sdk.api.dsmc.models.ModelsCreatePortRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AddPort
 *
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [CREATE]
 * 
 * Required scope: social
 * 
 * This endpoint create a dedicated servers port config in a namespace.
 */
@Getter
@Setter
public class AddPort extends Operation {
    /**
     * generated field's value
     */
    private String url = "/dsmcontroller/admin/namespaces/{namespace}/configs/ports/{name}";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String name;
    private String namespace;
    private ModelsCreatePortRequest body;

    /**
    * @param name required
    * @param namespace required
    * @param body required
    */
    @Builder
    public AddPort(
            String name,
            String namespace,
            ModelsCreatePortRequest body
    )
    {
        this.name = name;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public AddPort createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.name != null){
            pathParams.put("name", this.name);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelsCreatePortRequest getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.name == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelsDSMConfigRecord parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelsDSMConfigRecord().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}