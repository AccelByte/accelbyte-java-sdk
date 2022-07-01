/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.admin;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.models.ModelsListSessionResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * ListSession
 *
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSM:SESSION [READ]
 * 
 * Required scope: social
 * 
 * This endpoint lists all of sessions in a namespace managed by this service.
 * 
 * Parameter Offset and Count is Required
 */
@Getter
@Setter
public class ListSession extends Operation {
    /**
     * generated field's value
     */
    private String path = "/dsmcontroller/admin/namespaces/{namespace}/sessions";
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
    private String region;
    private Boolean withServer;
    private Integer count;
    private Integer offset;

    /**
    * @param namespace required
    * @param count required
    * @param offset required
    */
    @Builder
    public ListSession(
            String namespace,
            String region,
            Boolean withServer,
            Integer count,
            Integer offset
    )
    {
        this.namespace = namespace;
        this.region = region;
        this.withServer = withServer;
        this.count = count;
        this.offset = offset;
        
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
        queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
        queryParams.put("withServer", this.withServer == null ? null : Arrays.asList(String.valueOf(this.withServer)));
        queryParams.put("count", this.count == null ? null : Arrays.asList(String.valueOf(this.count)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.count == null) {
            return false;
        }
        if(this.offset == null) {
            return false;
        }
        return true;
    }

    public ModelsListSessionResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsListSessionResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("region", "None");
        result.put("withServer", "None");
        result.put("count", "None");
        result.put("offset", "None");
        return result;
    }
}