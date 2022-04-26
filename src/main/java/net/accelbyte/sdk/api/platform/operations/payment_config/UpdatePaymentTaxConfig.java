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
import net.accelbyte.sdk.api.platform.models.PaymentTaxConfigInfo;
import net.accelbyte.sdk.api.platform.models.PaymentTaxConfigEdit;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updatePaymentTaxConfig
 *
 * Update payment tax config.
 * 
 * 
 * 
 *      Request Body Parameters:
 * 
 * 
 *      Parameter                | Type    | Required | Description
 *     --------------------------|---------|----------|---------------------------------------------------------------------
 *     taxJarEnabled             | Boolean | false
 *     taxJarApiToken            | String  | false    | required, when taxJarEnabled is true and there is no existing token
 *     sandboxTaxJarApiToken     | String  | false    | optional
 *     taxJarProductCodesMapping | Map     | No       | key is item type(APP                                                |COINS |INGAMEITEM |BUNDLE |CODE |SUBSCRIPTION) and value is product tax code: https://developers.taxjar.com/api/reference/?ruby#get-list-tax-categories
 * 
 * 
 * 
 * Other detail info:
 *   * Required permission : resource="ADMIN:PAYMENT:CONFIG", action=4 (UPDATE)
 *   *  Returns : payment global tax config
 */
@Getter
@Setter
public class UpdatePaymentTaxConfig extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/payment/config/tax";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private PaymentTaxConfigEdit body;

    /**
    */
    @Builder
    public UpdatePaymentTaxConfig(
            PaymentTaxConfigEdit body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdatePaymentTaxConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }




    @Override
    public PaymentTaxConfigEdit getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        return true;
    }

    public PaymentTaxConfigInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new PaymentTaxConfigInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}