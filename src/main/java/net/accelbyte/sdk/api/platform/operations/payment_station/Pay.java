/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_station;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.PaymentProcessResult;
import net.accelbyte.sdk.api.platform.models.PaymentToken;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * pay
 *
 * Do payment(For now, this only support checkout.com).
 * Other detail info:
 * 
 *   * Returns : Payment process result
 */
@Getter
@Setter
public class Pay extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/public/namespaces/{namespace}/payment/orders/{paymentOrderNo}/pay";
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
    private String paymentOrderNo;
    private String paymentProvider;
    private String zipCode;
    private PaymentToken body;

    /**
    * @param namespace required
    * @param paymentOrderNo required
    */
    @Builder
    public Pay(
            String namespace,
            String paymentOrderNo,
            String paymentProvider,
            String zipCode,
            PaymentToken body
    )
    {
        this.namespace = namespace;
        this.paymentOrderNo = paymentOrderNo;
        this.paymentProvider = paymentProvider;
        this.zipCode = zipCode;
        this.body = body;
        
    }

    public Pay createFromJson(String json) throws JsonProcessingException {
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
        if (this.paymentOrderNo != null){
            pathParams.put("paymentOrderNo", this.paymentOrderNo);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("paymentProvider", this.paymentProvider == null ? null : Arrays.asList(this.paymentProvider));
        queryParams.put("zipCode", this.zipCode == null ? null : Arrays.asList(this.zipCode));
        return queryParams;
    }


    @Override
    public PaymentToken getBodyParams(){
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
        if(this.paymentOrderNo == null) {
            return false;
        }
        return true;
    }

    @Override
    public PaymentProcessResult parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new PaymentProcessResult().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("paymentProvider", "None");
        result.put("zipCode", "None");
        return result;
    }
}