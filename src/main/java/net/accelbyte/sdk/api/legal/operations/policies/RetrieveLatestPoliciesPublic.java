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
 * retrieveLatestPoliciesPublic
 *
 * Retrieve all active latest policies based on a namespace and country. The country will be read from user token.
 * Other detail info:
 * 
 *   * Leave the policyType empty if you want to be responded with all policy type
 *   *  Fill the tags if you want to filter the responded policy by tags
 *   *  Fill the defaultOnEmpty with true if you want to be responded with default country-specific policy if your requested country is not exist
 *   *  Fill the alwaysIncludeDefault with true if you want to be responded with always include default policy. If there are duplicate policies (default policies and country specific policies with same base policy) it'll include policy with same country code, for example:
 *     * Document 1 (default): Region US (default), UA
 *     * Document 2 (default): Region US (default)
 *     * Document 3 (default): Region US (default)
 *     * User: Region UA
 *     * Query: alwaysIncludeDefault: true
 *     * Response: Document 1 (UA), Document 2 (US), Document 3 (US)
 *   *  Required permission: login user
 */
@Getter
@Setter
public class RetrieveLatestPoliciesPublic extends Operation {
    /**
     * generated field's value
     */
    private String url = "/agreement/public/policies/namespaces/{namespace}";
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
    private Boolean alwaysIncludeDefault;
    private Boolean defaultOnEmpty;
    private String policyType;
    private String tags;

    /**
    * @param namespace required
    */
    @Builder
    public RetrieveLatestPoliciesPublic(
            String namespace,
            Boolean alwaysIncludeDefault,
            Boolean defaultOnEmpty,
            String policyType,
            String tags
    )
    {
        this.namespace = namespace;
        this.alwaysIncludeDefault = alwaysIncludeDefault;
        this.defaultOnEmpty = defaultOnEmpty;
        this.policyType = policyType;
        this.tags = tags;
        
        securities.add("Bearer");
    }

    public RetrieveLatestPoliciesPublic createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("alwaysIncludeDefault", this.alwaysIncludeDefault == null ? null : Arrays.asList(String.valueOf(this.alwaysIncludeDefault)));
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
        if(this.namespace == null) {
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
        result.put("alwaysIncludeDefault", "None");
        result.put("defaultOnEmpty", "None");
        result.put("policyType", "None");
        result.put("tags", "None");
        return result;
    }
}