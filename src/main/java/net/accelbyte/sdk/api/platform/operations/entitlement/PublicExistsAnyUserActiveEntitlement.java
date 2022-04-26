/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.entitlement;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.Ownership;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * publicExistsAnyUserActiveEntitlement
 *
 * Exists any user active entitlement of specified itemIds, skus and appIds
 * 
 * Other detail info:
 * 
 *   * Required permission : resource="NAMESPACE:{namespace}:USER:{userId}:ENTITLEMENT", action=2 (READ)
 */
@Getter
@Setter
public class PublicExistsAnyUserActiveEntitlement extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/public/namespaces/{namespace}/users/{userId}/entitlements/ownership/any";
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
    private String userId;
    private List<String> appIds;
    private List<String> itemIds;
    private List<String> skus;

    /**
    * @param namespace required
    * @param userId required
    */
    @Builder
    public PublicExistsAnyUserActiveEntitlement(
            String namespace,
            String userId,
            List<String> appIds,
            List<String> itemIds,
            List<String> skus
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.appIds = appIds;
        this.itemIds = itemIds;
        this.skus = skus;
        
        securities.add("Bearer");
    }

    public PublicExistsAnyUserActiveEntitlement createFromJson(String json) throws JsonProcessingException {
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
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("appIds", this.appIds == null ? null : this.appIds);
        queryParams.put("itemIds", this.itemIds == null ? null : this.itemIds);
        queryParams.put("skus", this.skus == null ? null : this.skus);
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
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public Ownership parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new Ownership().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("appIds", "multi");
        result.put("itemIds", "multi");
        result.put("skus", "multi");
        return result;
    }
}