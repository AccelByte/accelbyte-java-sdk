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
import net.accelbyte.sdk.api.platform.models.NotificationProcessResult;
import net.accelbyte.sdk.api.platform.models.PaymentOrderNotifySimulation;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * simulatePaymentOrderNotification
 *
 *  [TEST FACILITY ONLY] Forbidden in live environment. Simulate payment notification on sandbox payment order, usually for test usage to simulate real currency payment notification.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:PAYMENT", action=4 (UPDATE)
 *   *  Returns : notification process result
 */
@Getter
@Setter
public class SimulatePaymentOrderNotification extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/namespaces/{namespace}/payment/orders/{paymentOrderNo}/simulate-notification";
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
    private PaymentOrderNotifySimulation body;

    /**
    * @param namespace required
    * @param paymentOrderNo required
    */
    @Builder
    public SimulatePaymentOrderNotification(
            String namespace,
            String paymentOrderNo,
            PaymentOrderNotifySimulation body
    )
    {
        this.namespace = namespace;
        this.paymentOrderNo = paymentOrderNo;
        this.body = body;
        
        securities.add("Bearer");
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
    public PaymentOrderNotifySimulation getBodyParams(){
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

    public NotificationProcessResult parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new NotificationProcessResult().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}