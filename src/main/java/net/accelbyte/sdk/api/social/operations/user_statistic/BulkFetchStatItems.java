/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.social.operations.user_statistic;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * bulkFetchStatItems
 *
 * Bulk fetch multiple user's statitem value for a given namespace and statCode.
 * Other detail info:
 * + *Required permission*: resource="ADMIN:NAMESPACE:{namespace}:STATITEM", action=2 (READ)
 * + *Returns*: list of user's statItem
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class BulkFetchStatItems extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/social/v1/admin/namespaces/{namespace}/statitems/bulk";

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
    private String statCode;
    private String userIds;

    /**
    * @param namespace required
    * @param statCode required
    * @param userIds required
    */
    public BulkFetchStatItems(
            String namespace,
            String statCode,
            String userIds
    )
    {
        this.namespace = namespace;
        this.statCode = statCode;
        this.userIds = userIds;
    }

    @JsonIgnore
    public BulkFetchStatItems createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("statCode", this.statCode == null ? null : Arrays.asList(this.statCode));
        queryParams.put("userIds", this.userIds == null ? null : Arrays.asList(this.userIds));
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
        result.put("statCode","statCode");
        result.put("userIds","userIds");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "statCode",
            "userIds"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.statCode == null) {
            return false;
        }
        if(this.userIds == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public List<UserStatItemInfo> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<UserStatItemInfo>>() {});
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("statCode", "None");
        result.put("userIds", "None");
        return result;
    }
}