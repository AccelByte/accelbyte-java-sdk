/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_config;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.PaymentProviderConfigInfo;
import net.accelbyte.sdk.api.platform.models.PaymentProviderConfigEdit;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * createPaymentProviderConfig
 *
 * Create payment provider config.
 * 
 * 
 * 
 *      Request Body Parameters:
 * 
 * 
 *      Parameter | Type   | Required | Description
 *     -----------|--------|----------|-----------------------------------------------------------
 *     namespace  | String | Yes      | namespace, * indicates all namespace
 *     region     | String | Yes      | region, * indicates all regions
 *     aggregate  | String | No       | aggregate payment provider, such as XSOLLA, ADYEN, STRIPE
 *     specials   | List   | No       | special payment provider, such as ALIPAY, WXPAY
 * 
 * 
 * 
 * payment provider applied has priority:
 * 
 *   1. namespace and region match
 *   2. namespace matches and region is *
 *   3. region matches and namespace is *
 *   4. namespace and region are *
 * 
 * Other detail info:
 *   * Required permission : resource="ADMIN:PAYMENT:CONFIG", action=1 (CREATE)
 *   *  Returns : payment provider config
 */
@Getter
@Setter
public class CreatePaymentProviderConfig extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/admin/payment/config/provider";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private PaymentProviderConfigEdit body;

    /**
    */
    @Builder
    public CreatePaymentProviderConfig(
            PaymentProviderConfigEdit body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
    }




    @Override
    public PaymentProviderConfigEdit getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        return true;
    }

    public PaymentProviderConfigInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new PaymentProviderConfigInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}