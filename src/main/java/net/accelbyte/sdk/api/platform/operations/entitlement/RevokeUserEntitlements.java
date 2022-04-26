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
import net.accelbyte.sdk.api.platform.models.BulkOperationResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * revokeUserEntitlements
 *
 * Revoke user's entitlements by ids.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:ENTITLEMENT", action=4 (UPDATE)
 *   *  Returns : revoke entitlements count
 */
@Getter
@Setter
public class RevokeUserEntitlements extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/revoke/byIds";
    private String method = "PUT";
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
    private String entitlementIds;

    /**
    * @param namespace required
    * @param userId required
    * @param entitlementIds required
    */
    @Builder
    public RevokeUserEntitlements(
            String namespace,
            String userId,
            String entitlementIds
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.entitlementIds = entitlementIds;
        
        securities.add("Bearer");
    }

    public RevokeUserEntitlements createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("entitlementIds", this.entitlementIds == null ? null : Arrays.asList(this.entitlementIds));
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
        if(this.entitlementIds == null) {
            return false;
        }
        return true;
    }

    @Override
    public BulkOperationResult parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new BulkOperationResult().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("entitlementIds", "None");
        return result;
    }
}