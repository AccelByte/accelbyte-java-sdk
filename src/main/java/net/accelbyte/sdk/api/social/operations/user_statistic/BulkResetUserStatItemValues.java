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
import net.accelbyte.sdk.api.social.models.ADTOObjectForResettingUserStatItems;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * bulkResetUserStatItemValues
 *
 * Bulk reset user's statitem values for given namespace and user.
 * Other detail info:
 * + *Required permission*: resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:STATITEM", action=4 (UPDATE)
 * + *Returns*: bulk updated result
 */
@Getter
@Setter
public class BulkResetUserStatItemValues extends Operation {
    /**
     * generated field's value
     */
    private String url = "/social/v2/admin/namespaces/{namespace}/users/{userId}/statitems/value/reset/bulk";
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
    private String userId;
    private String additionalKey;
    private List<ADTOObjectForResettingUserStatItems> body;

    /**
    * @param namespace required
    * @param userId required
    */
    @Builder
    public BulkResetUserStatItemValues(
            String namespace,
            String userId,
            String additionalKey,
            List<ADTOObjectForResettingUserStatItems> body
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.additionalKey = additionalKey;
        this.body = body;
        
        securities.add("Bearer");
    }

    public BulkResetUserStatItemValues createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("additionalKey", this.additionalKey == null ? null : Arrays.asList(this.additionalKey));
        return queryParams;
    }


    @Override
    public List<ADTOObjectForResettingUserStatItems> getBodyParams(){
        return this.body;
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

    @Override
    public List<BulkStatItemOperationResult> parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<BulkStatItemOperationResult>>() {});
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("additionalKey", "None");
        return result;
    }
}