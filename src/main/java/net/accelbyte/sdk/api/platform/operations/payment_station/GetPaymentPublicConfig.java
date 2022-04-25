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
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * getPaymentPublicConfig
 *
 * Get payment provider public config, at current only Strip provide public config.
 * Other detail info:
 * 
 *   * Returns : Public config
 */
@Getter
@Setter
public class GetPaymentPublicConfig extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/public/namespaces/{namespace}/payment/publicconfig";
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
    private Boolean sandbox;
    private String paymentProvider;
    private String region;

    /**
    * @param namespace required
    * @param paymentProvider required
    * @param region required
    */
    @Builder
    public GetPaymentPublicConfig(
            String namespace,
            Boolean sandbox,
            String paymentProvider,
            String region
    )
    {
        this.namespace = namespace;
        this.sandbox = sandbox;
        this.paymentProvider = paymentProvider;
        this.region = region;
        
    }

    public GetPaymentPublicConfig createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("sandbox", this.sandbox == null ? null : Arrays.asList(String.valueOf(this.sandbox)));
        queryParams.put("paymentProvider", this.paymentProvider == null ? null : Arrays.asList(this.paymentProvider));
        queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
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
        if(this.paymentProvider == null) {
            return false;
        }
        if(this.region == null) {
            return false;
        }
        return true;
    }

    @Override
    public Map<String, ?> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<Map<String, ?>>() {});
        }
        throw new ResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("sandbox", "None");
        result.put("paymentProvider", "None");
        result.put("region", "None");
        return result;
    }
}