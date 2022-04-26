/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_config;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.PaymentProviderConfigInfo;
import net.accelbyte.sdk.api.platform.models.PaymentProviderConfigEdit;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updatePaymentProviderConfig
 *
 * Update payment provider config.
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
 *   * Required permission : resource="ADMIN:PAYMENT:CONFIG", action=4 (UPDATE)
 *   *  Returns : payment provider config
 */
@Getter
@Setter
public class UpdatePaymentProviderConfig extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/payment/config/provider/{id}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String id;
    private PaymentProviderConfigEdit body;

    /**
    * @param id required
    */
    @Builder
    public UpdatePaymentProviderConfig(
            String id,
            PaymentProviderConfigEdit body
    )
    {
        this.id = id;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdatePaymentProviderConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.id != null){
            pathParams.put("id", this.id);
        }
        return pathParams;
    }



    @Override
    public PaymentProviderConfigEdit getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.id == null) {
            return false;
        }
        return true;
    }

    public PaymentProviderConfigInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new PaymentProviderConfigInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}