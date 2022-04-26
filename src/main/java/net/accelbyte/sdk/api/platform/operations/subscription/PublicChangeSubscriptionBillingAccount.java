/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.subscription;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.SubscriptionInfo;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * publicChangeSubscriptionBillingAccount
 *
 * Request to change a subscription billing account, this will guide user to payment station. The actual change will happen at the 0 payment notification successfully handled.
 * Only ACTIVE USER subscription with real currency billing account can be changed.
 * Other detail info:
 * 
 *   * Required permission : resource="NAMESPACE:{namespace}:USER:{userId}:SUBSCRIPTION", action=4 (UPDATE)
 *   *  Returns : updated subscription
 */
@Getter
@Setter
public class PublicChangeSubscriptionBillingAccount extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/public/namespaces/{namespace}/users/{userId}/subscriptions/{subscriptionId}/billingAccount";
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
    private String subscriptionId;
    private String userId;

    /**
    * @param namespace required
    * @param subscriptionId required
    * @param userId required
    */
    @Builder
    public PublicChangeSubscriptionBillingAccount(
            String namespace,
            String subscriptionId,
            String userId
    )
    {
        this.namespace = namespace;
        this.subscriptionId = subscriptionId;
        this.userId = userId;
        
        securities.add("Bearer");
    }

    public PublicChangeSubscriptionBillingAccount createFromJson(String json) throws JsonProcessingException {
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
        if (this.subscriptionId != null){
            pathParams.put("subscriptionId", this.subscriptionId);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
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
        if(this.subscriptionId == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public SubscriptionInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new SubscriptionInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}