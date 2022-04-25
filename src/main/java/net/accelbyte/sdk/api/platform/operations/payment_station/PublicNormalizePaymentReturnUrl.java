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
 * publicNormalizePaymentReturnUrl
 *
 * Normalize payment return url for payment provider
 * Field                                                                                                                                                        | Type   | Required | Description
 * -------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|----------|-----------------------
 * orderNo                                                                                                                                                      | String | Yes      | order no
 * paymentStatus                                                                                                                                                | String | Yes      |
 * 
 *   * DONE: The payment was successfully completed.
 *   * CANCELLED: The payment was cancelled by the shopper before completion, or the shopper returned to the merchant's site before completing the transaction.
 *   * PENDING: Inform the shopper that you've received their order, and are waiting for the payment to be completed.
 * 
 * When the shopper has completed the payment you will receive a successful AUTHORISATION.
 *   * RECEIVED: Inform the shopper that you've received their order, and are waiting for the payment to clear.
 *   * UNKNOWN: An error occurred during the payment processing.
 *   * FAILED: Shopper paid failed because of various reasons.
 * 
 * 
 * reason                                                                                                                                                       | String | No       | payment status reason
 * 
 * Other detail info:
 * 
 *   * xsolla : parameters 'user_id', 'foreinginvoice', 'invoice_id' and 'status' will be automatically added to the link
 *   *  adyen : https://docs.adyen.com/developers/checkout/web-sdk
 */
@Getter
@Setter
public class PublicNormalizePaymentReturnUrl extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/public/namespaces/{namespace}/payment/returnurl";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList();
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String payerID;
    private String foreinginvoice;
    private String invoiceId;
    private String payload;
    private String redirectResult;
    private String resultCode;
    private String sessionId;
    private String status;
    private String token;
    private String type;
    private String userId;
    private String orderNo;
    private String paymentOrderNo;
    private String paymentProvider;
    private String returnUrl;

    /**
    * @param namespace required
    * @param orderNo required
    * @param paymentOrderNo required
    * @param paymentProvider required
    * @param returnUrl required
    */
    @Builder
    public PublicNormalizePaymentReturnUrl(
            String namespace,
            String payerID,
            String foreinginvoice,
            String invoiceId,
            String payload,
            String redirectResult,
            String resultCode,
            String sessionId,
            String status,
            String token,
            String type,
            String userId,
            String orderNo,
            String paymentOrderNo,
            String paymentProvider,
            String returnUrl
    )
    {
        this.namespace = namespace;
        this.payerID = payerID;
        this.foreinginvoice = foreinginvoice;
        this.invoiceId = invoiceId;
        this.payload = payload;
        this.redirectResult = redirectResult;
        this.resultCode = resultCode;
        this.sessionId = sessionId;
        this.status = status;
        this.token = token;
        this.type = type;
        this.userId = userId;
        this.orderNo = orderNo;
        this.paymentOrderNo = paymentOrderNo;
        this.paymentProvider = paymentProvider;
        this.returnUrl = returnUrl;
        
    }

    public PublicNormalizePaymentReturnUrl createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("PayerID", this.payerID == null ? null : Arrays.asList(this.payerID));
        queryParams.put("foreinginvoice", this.foreinginvoice == null ? null : Arrays.asList(this.foreinginvoice));
        queryParams.put("invoice_id", this.invoiceId == null ? null : Arrays.asList(this.invoiceId));
        queryParams.put("payload", this.payload == null ? null : Arrays.asList(this.payload));
        queryParams.put("redirectResult", this.redirectResult == null ? null : Arrays.asList(this.redirectResult));
        queryParams.put("resultCode", this.resultCode == null ? null : Arrays.asList(this.resultCode));
        queryParams.put("sessionId", this.sessionId == null ? null : Arrays.asList(this.sessionId));
        queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
        queryParams.put("token", this.token == null ? null : Arrays.asList(this.token));
        queryParams.put("type", this.type == null ? null : Arrays.asList(this.type));
        queryParams.put("user_id", this.userId == null ? null : Arrays.asList(this.userId));
        queryParams.put("orderNo", this.orderNo == null ? null : Arrays.asList(this.orderNo));
        queryParams.put("paymentOrderNo", this.paymentOrderNo == null ? null : Arrays.asList(this.paymentOrderNo));
        queryParams.put("paymentProvider", this.paymentProvider == null ? null : Arrays.asList(this.paymentProvider));
        queryParams.put("returnUrl", this.returnUrl == null ? null : Arrays.asList(this.returnUrl));
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
        if(this.orderNo == null) {
            return false;
        }
        if(this.paymentOrderNo == null) {
            return false;
        }
        if(this.paymentProvider == null) {
            return false;
        }
        if(this.returnUrl == null) {
            return false;
        }
        return true;
    }

    @Override
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("PayerID", "None");
        result.put("foreinginvoice", "None");
        result.put("invoice_id", "None");
        result.put("payload", "None");
        result.put("redirectResult", "None");
        result.put("resultCode", "None");
        result.put("sessionId", "None");
        result.put("status", "None");
        result.put("token", "None");
        result.put("type", "None");
        result.put("user_id", "None");
        result.put("orderNo", "None");
        result.put("paymentOrderNo", "None");
        result.put("paymentProvider", "None");
        result.put("returnUrl", "None");
        return result;
    }
}