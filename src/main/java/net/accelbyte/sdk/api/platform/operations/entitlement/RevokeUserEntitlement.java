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
import net.accelbyte.sdk.api.platform.models.EntitlementInfo;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * revokeUserEntitlement
 *
 * Revoke user entitlement.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:ENTITLEMENT", action=4 (UPDATE)
 *   *  Returns : revoke entitlement
 */
@Getter
@Setter
public class RevokeUserEntitlement extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/{entitlementId}/revoke";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String entitlementId;
    private String namespace;
    private String userId;

    /**
    * @param entitlementId required
    * @param namespace required
    * @param userId required
    */
    @Builder
    public RevokeUserEntitlement(
            String entitlementId,
            String namespace,
            String userId
    )
    {
        this.entitlementId = entitlementId;
        this.namespace = namespace;
        this.userId = userId;
        
        securities.add("Bearer");
    }

    public RevokeUserEntitlement createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.entitlementId != null){
            pathParams.put("entitlementId", this.entitlementId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
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
        if(this.entitlementId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    @Override
    public EntitlementInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new EntitlementInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}