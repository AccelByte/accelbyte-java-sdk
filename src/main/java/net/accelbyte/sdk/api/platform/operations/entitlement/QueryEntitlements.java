/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.entitlement;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.EntitlementPagingSlicedResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * queryEntitlements
 *
 * Query entitlements.
 * 
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:ENTITLEMENT", action=2 (READ)
 *   *  Returns : entitlement list
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class QueryEntitlements extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/admin/namespaces/{namespace}/entitlements";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList();

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private String namespace;
    private Boolean activeOnly;
    private String appType;
    private String entitlementClazz;
    private String entitlementName;
    private List<String> itemId;
    private Integer limit;
    private Integer offset;
    private String userId;

    /**
    * @param namespace required
    */
    @Builder
    public QueryEntitlements(
            String namespace,
            Boolean activeOnly,
            String appType,
            String entitlementClazz,
            String entitlementName,
            List<String> itemId,
            Integer limit,
            Integer offset,
            String userId
    )
    {
        this.namespace = namespace;
        this.activeOnly = activeOnly;
        this.appType = appType;
        this.entitlementClazz = entitlementClazz;
        this.entitlementName = entitlementName;
        this.itemId = itemId;
        this.limit = limit;
        this.offset = offset;
        this.userId = userId;
    }

    @JsonIgnore
    public QueryEntitlements createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("activeOnly", this.activeOnly == null ? null : Arrays.asList(String.valueOf(this.activeOnly)));
        queryParams.put("appType", this.appType == null ? null : Arrays.asList(this.appType));
        queryParams.put("entitlementClazz", this.entitlementClazz == null ? null : Arrays.asList(this.entitlementClazz));
        queryParams.put("entitlementName", this.entitlementName == null ? null : Arrays.asList(this.entitlementName));
        queryParams.put("itemId", this.itemId == null ? null : this.itemId);
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("userId", this.userId == null ? null : Arrays.asList(this.userId));
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("activeOnly","activeOnly");
        result.put("appType","appType");
        result.put("entitlementClazz","entitlementClazz");
        result.put("entitlementName","entitlementName");
        result.put("itemId","itemId");
        result.put("limit","limit");
        result.put("offset","offset");
        result.put("userId","userId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public EntitlementPagingSlicedResult parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new EntitlementPagingSlicedResult().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("activeOnly", "None");
        result.put("appType", "None");
        result.put("entitlementClazz", "None");
        result.put("entitlementName", "None");
        result.put("itemId", "multi");
        result.put("limit", "None");
        result.put("offset", "None");
        result.put("userId", "None");
        return result;
    }
}