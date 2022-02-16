/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.AccountcommonUserLinkedPlatformsResponseV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminGetUserPlatformAccountsV3
 *
 * 
 * 
 * Required permission 'ADMIN:NAMESPACE:{namespace}:USER:{userId} [READ]'.
 * 
 * 
 * 
 * 
 * ## Justice Platform Account
 * 
 * 
 * 
 * 
 * The permission âADMIN:NAMESPACE:{namespace}:JUSTICE:USER:{userId}â [READ]
 * is required in order to read the UserID who linked with the user.
 * 
 * 
 * 
 * Gets platform accounts that are already linked with user account
 * 
 * action code : 10128
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminGetUserPlatformAccountsV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/admin/namespaces/{namespace}/users/{userId}/platforms";

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
    private String userId;
    private String after;
    private String before;
    private Integer limit;

    /**
    * @param namespace required
    * @param userId required
    */
    public AdminGetUserPlatformAccountsV3(
            String namespace,
            String userId,
            String after,
            String before,
            Integer limit
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.after = after;
        this.before = before;
        this.limit = limit;
    }

    @JsonIgnore
    public AdminGetUserPlatformAccountsV3 createFromJson(String json) throws JsonProcessingException {
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
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("after", this.after == null ? null : Arrays.asList(this.after));
        queryParams.put("before", this.before == null ? null : Arrays.asList(this.before));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
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
        result.put("userId","userId");
        result.put("after","after");
        result.put("before","before");
        result.put("limit","limit");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "userId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public AccountcommonUserLinkedPlatformsResponseV3 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new AccountcommonUserLinkedPlatformsResponseV3().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("after", "None");
        result.put("before", "None");
        result.put("limit", "None");
        return result;
    }
}