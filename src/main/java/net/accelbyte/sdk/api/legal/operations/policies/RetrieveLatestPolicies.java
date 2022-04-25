/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.policies;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * retrieveLatestPolicies
 *
 * Retrieve all active latest policies based on a country.
 * Other detail info:
 * 
 *   * Leave the policyType empty if you want to be responded with all policy type
 *   *  Fill the tags if you want to filter the responded policy by tags
 *   *  Fill the defaultOnEmpty with true if you want to be responded with default country-specific policy if your requested country is not exist
 */
@Getter
@Setter
public class RetrieveLatestPolicies extends Operation {
    /**
     * generated field's value
     */
    private String url = "/agreement/public/policies/countries/{countryCode}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String countryCode;
    private Boolean defaultOnEmpty;
    private String policyType;
    private String tags;

    /**
    * @param countryCode required
    */
    @Builder
    public RetrieveLatestPolicies(
            String countryCode,
            Boolean defaultOnEmpty,
            String policyType,
            String tags
    )
    {
        this.countryCode = countryCode;
        this.defaultOnEmpty = defaultOnEmpty;
        this.policyType = policyType;
        this.tags = tags;
        
    }

    public RetrieveLatestPolicies createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.countryCode != null){
            pathParams.put("countryCode", this.countryCode);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("defaultOnEmpty", this.defaultOnEmpty == null ? null : Arrays.asList(String.valueOf(this.defaultOnEmpty)));
        queryParams.put("policyType", this.policyType == null ? null : Arrays.asList(this.policyType));
        queryParams.put("tags", this.tags == null ? null : Arrays.asList(this.tags));
        return queryParams;
    }




    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.countryCode == null) {
            return false;
        }
        return true;
    }

    @Override
    public List<RetrievePolicyPublicResponse> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<RetrievePolicyPublicResponse>>() {});
        }
        throw new ResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("defaultOnEmpty", "None");
        result.put("policyType", "None");
        result.put("tags", "None");
        return result;
    }
}