/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.subscription;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.SubscriptionPagingSlicedResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * querySubscriptions
 *
 * Query subscriptions.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:SUBSCRIPTION", action=2 (READ)
 *   *  Returns : paginated subscriptions
 */
@Getter
@Setter
public class QuerySubscriptions extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/namespaces/{namespace}/subscriptions";
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
    private String chargeStatus;
    private String itemId;
    private Integer limit;
    private Integer offset;
    private String sku;
    private String status;
    private String subscribedBy;
    private String userId;

    /**
    * @param namespace required
    */
    @Builder
    public QuerySubscriptions(
            String namespace,
            String chargeStatus,
            String itemId,
            Integer limit,
            Integer offset,
            String sku,
            String status,
            String subscribedBy,
            String userId
    )
    {
        this.namespace = namespace;
        this.chargeStatus = chargeStatus;
        this.itemId = itemId;
        this.limit = limit;
        this.offset = offset;
        this.sku = sku;
        this.status = status;
        this.subscribedBy = subscribedBy;
        this.userId = userId;
        
        securities.add("Bearer");
    }

    public QuerySubscriptions createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("chargeStatus", this.chargeStatus == null ? null : Arrays.asList(this.chargeStatus));
        queryParams.put("itemId", this.itemId == null ? null : Arrays.asList(this.itemId));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("sku", this.sku == null ? null : Arrays.asList(this.sku));
        queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
        queryParams.put("subscribedBy", this.subscribedBy == null ? null : Arrays.asList(this.subscribedBy));
        queryParams.put("userId", this.userId == null ? null : Arrays.asList(this.userId));
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

    @Override
    public SubscriptionPagingSlicedResult parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new SubscriptionPagingSlicedResult().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("chargeStatus", "None");
        result.put("itemId", "None");
        result.put("limit", "None");
        result.put("offset", "None");
        result.put("sku", "None");
        result.put("status", "None");
        result.put("subscribedBy", "None");
        result.put("userId", "None");
        return result;
    }
}