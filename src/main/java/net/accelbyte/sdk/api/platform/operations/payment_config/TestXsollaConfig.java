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
import net.accelbyte.sdk.api.platform.models.TestResult;
import net.accelbyte.sdk.api.platform.models.XsollaConfig;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * testXsollaConfig
 *
 * Check xsolla configuration, Reference: [Xsolla Document](https://developers.xsolla.com/?#simple-checkout).
 * 
 * #### Check List:
 * 
 *   * merchantId
 *   * projectId
 *   * apiKey
 * 
 * 
 * 
 * #### Non-check list:
 * 
 *   * projectSecretKey
 * 
 * Other detail info:
 *   * Required permission : resource="ADMIN:PAYMENT:CONFIG", action=4 (UPDATE)
 *   *  Returns : test result
 */
@Getter
@Setter
public class TestXsollaConfig extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/payment/config/merchant/xsollaconfig/test";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private XsollaConfig body;

    /**
    */
    @Builder
    public TestXsollaConfig(
            XsollaConfig body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
    }




    @Override
    public XsollaConfig getBodyParams(){
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

    public TestResult parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new TestResult().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}