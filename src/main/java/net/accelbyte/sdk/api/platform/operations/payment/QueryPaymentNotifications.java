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
import net.accelbyte.sdk.api.platform.models.PaymentNotificationPagingSlicedResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * queryPaymentNotifications
 *
 * Query payment notifications.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:PAYMENT:NOTIFICATION", action=2 (READ)
 *   *  Returns : Payment notifications
 */
@Getter
@Setter
public class QueryPaymentNotifications extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/namespaces/{namespace}/payment/notifications";
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
    private String endDate;
    private String externalId;
    private Integer limit;
    private String notificationSource;
    private String notificationType;
    private Integer offset;
    private String paymentOrderNo;
    private String startDate;
    private String status;

    /**
    * @param namespace required
    */
    @Builder
    public QueryPaymentNotifications(
            String namespace,
            String endDate,
            String externalId,
            Integer limit,
            String notificationSource,
            String notificationType,
            Integer offset,
            String paymentOrderNo,
            String startDate,
            String status
    )
    {
        this.namespace = namespace;
        this.endDate = endDate;
        this.externalId = externalId;
        this.limit = limit;
        this.notificationSource = notificationSource;
        this.notificationType = notificationType;
        this.offset = offset;
        this.paymentOrderNo = paymentOrderNo;
        this.startDate = startDate;
        this.status = status;
        
        securities.add("Bearer");
    }

    public QueryPaymentNotifications createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
        queryParams.put("externalId", this.externalId == null ? null : Arrays.asList(this.externalId));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("notificationSource", this.notificationSource == null ? null : Arrays.asList(this.notificationSource));
        queryParams.put("notificationType", this.notificationType == null ? null : Arrays.asList(this.notificationType));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("paymentOrderNo", this.paymentOrderNo == null ? null : Arrays.asList(this.paymentOrderNo));
        queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
        queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
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
        return true;
    }

    public PaymentNotificationPagingSlicedResult parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new PaymentNotificationPagingSlicedResult().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("endDate", "None");
        result.put("externalId", "None");
        result.put("limit", "None");
        result.put("notificationSource", "None");
        result.put("notificationType", "None");
        result.put("offset", "None");
        result.put("paymentOrderNo", "None");
        result.put("startDate", "None");
        result.put("status", "None");
        return result;
    }
}