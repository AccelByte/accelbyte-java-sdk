/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.entitlement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.TimedOwnership;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * publicGetUserEntitlementOwnershipBySku
 *
 * Get user entitlement ownership by sku.
 * 
 * Other detail info:
 * 
 *   * Required permission : resource="NAMESPACE:{namespace}:USER:{userId}:ENTITLEMENT", action=2 (READ)
 */
@Getter
@Setter
public class PublicGetUserEntitlementOwnershipBySku extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/public/namespaces/{namespace}/users/{userId}/entitlements/ownership/bySku";
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
    private String entitlementClazz;
    private String sku;

    /**
    * @param namespace required
    * @param userId required
    * @param sku required
    */
    @Builder
    public PublicGetUserEntitlementOwnershipBySku(
            String namespace,
            String userId,
            String entitlementClazz,
            String sku
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.entitlementClazz = entitlementClazz;
        this.sku = sku;
        
        securities.add("Bearer");
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
        queryParams.put("entitlementClazz", this.entitlementClazz == null ? null : Arrays.asList(this.entitlementClazz));
        queryParams.put("sku", this.sku == null ? null : Arrays.asList(this.sku));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        if(this.sku == null) {
            return false;
        }
        return true;
    }

    public TimedOwnership parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new TimedOwnership().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("entitlementClazz", "None");
        result.put("sku", "None");
        return result;
    }
    public enum EntitlementClazz {
        APP("APP"),
        CODE("CODE"),
        ENTITLEMENT("ENTITLEMENT"),
        MEDIA("MEDIA"),
        SUBSCRIPTION("SUBSCRIPTION");

        private String value;

        EntitlementClazz(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }
    
    
    public static class PublicGetUserEntitlementOwnershipBySkuBuilder {
        private String entitlementClazz;
        
        
        public PublicGetUserEntitlementOwnershipBySkuBuilder entitlementClazz(final String entitlementClazz) {
            this.entitlementClazz = entitlementClazz;
            return this;
        }
        
        public PublicGetUserEntitlementOwnershipBySkuBuilder entitlementClazzFromEnum(final EntitlementClazz entitlementClazz) {
            this.entitlementClazz = entitlementClazz.toString();
            return this;
        }
    }
}