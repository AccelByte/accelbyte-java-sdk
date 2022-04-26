/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.user_statistic;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * deleteUserStatItems_2
 *
 * Delete user's stat items for given namespace, statCode, and user Id.
 * If query param *additionalKey* is provided, it will delete user stat items of specific key (i.e. characterName).
 * Otherwise, it will delete all stat items related to the user Id.
 * 
 * Delete user's statItems given stat code.
 * Other detail info:
 *                   *  Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:STATITEM", action=8 (DELETE)
 *                   *  Returns : no content
 */
@Getter
@Setter
public class DeleteUserStatItems2 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/social/v2/admin/namespaces/{namespace}/users/{userId}/stats/{statCode}/statitems";
    private String method = "DELETE";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String statCode;
    private String userId;
    private String additionalKey;

    /**
    * @param namespace required
    * @param statCode required
    * @param userId required
    */
    @Builder
    public DeleteUserStatItems2(
            String namespace,
            String statCode,
            String userId,
            String additionalKey
    )
    {
        this.namespace = namespace;
        this.statCode = statCode;
        this.userId = userId;
        this.additionalKey = additionalKey;
        
        securities.add("Bearer");
    }

    public DeleteUserStatItems2 createFromJson(String json) throws JsonProcessingException {
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
        if (this.statCode != null){
            pathParams.put("statCode", this.statCode);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("additionalKey", this.additionalKey == null ? null : Arrays.asList(this.additionalKey));
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
        if(this.statCode == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    @Override
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("additionalKey", "None");
        return result;
    }
}