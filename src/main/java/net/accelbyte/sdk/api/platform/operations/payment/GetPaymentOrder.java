/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.PaymentOrderInfo;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * getPaymentOrder
 *
 * Get payment order by paymentOrderNo.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:PAYMENT", action=2 (READ)
 *   *  Returns : payment order instance
 */
@Getter
@Setter
public class GetPaymentOrder extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/admin/namespaces/{namespace}/payment/orders/{paymentOrderNo}";
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
    private String paymentOrderNo;

    /**
    * @param namespace required
    * @param paymentOrderNo required
    */
    @Builder
    public GetPaymentOrder(
            String namespace,
            String paymentOrderNo
    )
    {
        this.namespace = namespace;
        this.paymentOrderNo = paymentOrderNo;
        
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
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.paymentOrderNo == null) {
            return false;
        }
        return true;
    }

    public PaymentOrderInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new PaymentOrderInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}