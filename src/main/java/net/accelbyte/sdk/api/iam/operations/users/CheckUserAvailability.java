/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * CheckUserAvailability
 *
 * Check user's account availability.
 * Available field :
 * - displayName
 * 
 * If request include access token with user ID data, that user ID will be excluded from availability check.
 * For example, in case user update his emailAddress, he can use his own emailAddress to update his account.
 * 
 * Response Code :
 * - Account Available : 404 (not found)
 * - Account Not Available : 204 (no content)
 */
@Getter
@Setter
public class CheckUserAvailability extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/public/namespaces/{namespace}/users/availability";
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
    private String field;
    private String query;

    /**
    * @param namespace required
    * @param field required
    * @param query required
    */
    @Builder
    public CheckUserAvailability(
            String namespace,
            String field,
            String query
    )
    {
        this.namespace = namespace;
        this.field = field;
        this.query = query;
        
        securities.add("Bearer");
    }

    public CheckUserAvailability createFromJson(String json) throws JsonProcessingException {
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
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("field", this.field == null ? null : Arrays.asList(this.field));
        queryParams.put("query", this.query == null ? null : Arrays.asList(this.query));
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
        if(this.field == null) {
            return false;
        }
        if(this.query == null) {
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
        result.put("field", "None");
        result.put("query", "None");
        return result;
    }
}