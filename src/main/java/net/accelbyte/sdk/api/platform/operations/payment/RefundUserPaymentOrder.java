/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.PaymentOrderInfo;
import net.accelbyte.sdk.api.platform.models.PaymentOrderRefund;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * refundUserPaymentOrder
 *
 *  [SERVICE COMMUNICATION ONLY] This API is used to refund order by paymentOrderNo from justice service.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:PAYMENT", action=4 (UPDATE)
 */
@Getter
@Setter
public class RefundUserPaymentOrder extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/namespaces/{namespace}/users/{userId}/payment/orders/{paymentOrderNo}/refund";
    private String method = "PUT";
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
    private String userId;
    private PaymentOrderRefund body;

    /**
    * @param namespace required
    * @param paymentOrderNo required
    * @param userId required
    */
    @Builder
    public RefundUserPaymentOrder(
            String namespace,
            String paymentOrderNo,
            String userId,
            PaymentOrderRefund body
    )
    {
        this.namespace = namespace;
        this.paymentOrderNo = paymentOrderNo;
        this.userId = userId;
        this.body = body;
        
        securities.add("Bearer");
    }

    public RefundUserPaymentOrder createFromJson(String json) throws JsonProcessingException {
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
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }



    @Override
    public PaymentOrderRefund getBodyParams(){
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
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    @Override
    public PaymentOrderInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new PaymentOrderInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}