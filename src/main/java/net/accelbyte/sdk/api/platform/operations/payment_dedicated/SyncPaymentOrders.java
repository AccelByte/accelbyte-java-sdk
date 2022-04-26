/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_dedicated;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.PaymentOrderSyncResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * syncPaymentOrders
 *
 * Sync payment orders. If response contains nextEvaluatedKey, please use it as query param in the next call to fetch the next batch, a batch has 1000 elements or less.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:PAYMENT", action=2 (READ)
 *   *  Returns : sync payment orders
 */
@Getter
@Setter
public class SyncPaymentOrders extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/payment/orders";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String nextEvaluatedKey;
    private String end;
    private String start;

    /**
    * @param end required
    * @param start required
    */
    @Builder
    public SyncPaymentOrders(
            String nextEvaluatedKey,
            String end,
            String start
    )
    {
        this.nextEvaluatedKey = nextEvaluatedKey;
        this.end = end;
        this.start = start;
        
        securities.add("Bearer");
    }

    public SyncPaymentOrders createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }


    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("nextEvaluatedKey", this.nextEvaluatedKey == null ? null : Arrays.asList(this.nextEvaluatedKey));
        queryParams.put("end", this.end == null ? null : Arrays.asList(this.end));
        queryParams.put("start", this.start == null ? null : Arrays.asList(this.start));
        return queryParams;
    }




    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.end == null) {
            return false;
        }
        if(this.start == null) {
            return false;
        }
        return true;
    }

    public PaymentOrderSyncResult parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new PaymentOrderSyncResult().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("nextEvaluatedKey", "None");
        result.put("end", "None");
        result.put("start", "None");
        return result;
    }
}