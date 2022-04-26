/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.eventlog.operations.event_v2;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.models.ModelsEventResponseV2;
import net.accelbyte.sdk.api.eventlog.models.ModelsGenericQueryPayload;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * QueryEventStreamHandler
 *
 * 
 * 
 * This endpoint is using POST which is somewhat unfamiliar,
 * but it's logical that we have to send/post a filter (search term) in order to get the data.
 * 
 * 
 * 
 * 
 * This endpoint will not return anything if you give it an empty filters in the request body.
 * 
 * 
 * 
 * 
 * Required permission `ADMIN:NAMESPACE:{namespace}:EVENT [READ]` and scope `"+scope+"`
 */
@Getter
@Setter
public class QueryEventStreamHandler extends Operation {
    /**
     * generated field's value
     */
    private String url = "/event/v2/admin/namespaces/{namespace}/query";
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
    private String endDate;
    private Integer offset;
    private Integer pageSize;
    private String startDate;
    private ModelsGenericQueryPayload body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public QueryEventStreamHandler(
            String namespace,
            String endDate,
            Integer offset,
            Integer pageSize,
            String startDate,
            ModelsGenericQueryPayload body
    )
    {
        this.namespace = namespace;
        this.endDate = endDate;
        this.offset = offset;
        this.pageSize = pageSize;
        this.startDate = startDate;
        this.body = body;
        
        securities.add("Bearer");
    }

    public QueryEventStreamHandler createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("pageSize", this.pageSize == null ? null : Arrays.asList(String.valueOf(this.pageSize)));
        queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
        return queryParams;
    }


    @Override
    public ModelsGenericQueryPayload getBodyParams(){
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

    public ModelsEventResponseV2 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsEventResponseV2().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("endDate", "None");
        result.put("offset", "None");
        result.put("pageSize", "None");
        result.put("startDate", "None");
        return result;
    }
}