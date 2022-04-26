/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.order;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.OrderPagingResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * queryOrders
 *
 * Query orders.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:ORDER", action=2 (READ)
 *   *  Returns : query orders
 */
@Getter
@Setter
public class QueryOrders extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/namespaces/{namespace}/orders";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String endTime;
    private Integer limit;
    private Integer offset;
    private List<String> orderNos;
    private String sortBy;
    private String startTime;
    private String status;
    private Boolean withTotal;

    /**
    * @param namespace required
    */
    @Builder
    public QueryOrders(
            String namespace,
            String endTime,
            Integer limit,
            Integer offset,
            List<String> orderNos,
            String sortBy,
            String startTime,
            String status,
            Boolean withTotal
    )
    {
        this.namespace = namespace;
        this.endTime = endTime;
        this.limit = limit;
        this.offset = offset;
        this.orderNos = orderNos;
        this.sortBy = sortBy;
        this.startTime = startTime;
        this.status = status;
        this.withTotal = withTotal;
        
        securities.add("Bearer");
    }

    public QueryOrders createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("endTime", this.endTime == null ? null : Arrays.asList(this.endTime));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("orderNos", this.orderNos == null ? null : this.orderNos);
        queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
        queryParams.put("startTime", this.startTime == null ? null : Arrays.asList(this.startTime));
        queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
        queryParams.put("withTotal", this.withTotal == null ? null : Arrays.asList(String.valueOf(this.withTotal)));
        return queryParams;
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

    public OrderPagingResult parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OrderPagingResult().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("endTime", "None");
        result.put("limit", "None");
        result.put("offset", "None");
        result.put("orderNos", "multi");
        result.put("sortBy", "None");
        result.put("startTime", "None");
        result.put("status", "None");
        result.put("withTotal", "None");
        return result;
    }
}