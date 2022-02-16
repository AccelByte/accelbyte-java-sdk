/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.legal.operations.policies;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class RetrieveLatestPoliciesPublic extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/agreement/public/policies/namespaces/{namespace}";

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
    private Boolean alwaysIncludeDefault;
    private Boolean defaultOnEmpty;
    private String policyType;
    private String tags;

    /**
    * @param namespace required
    */
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
    }

    @JsonIgnore
    public RetrieveLatestPoliciesPublic createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("alwaysIncludeDefault", this.alwaysIncludeDefault == null ? null : Arrays.asList(String.valueOf(this.alwaysIncludeDefault)));
        queryParams.put("defaultOnEmpty", this.defaultOnEmpty == null ? null : Arrays.asList(String.valueOf(this.defaultOnEmpty)));
        queryParams.put("policyType", this.policyType == null ? null : Arrays.asList(this.policyType));
        queryParams.put("tags", this.tags == null ? null : Arrays.asList(this.tags));
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
        result.put("alwaysIncludeDefault","alwaysIncludeDefault");
        result.put("defaultOnEmpty","defaultOnEmpty");
        result.put("policyType","policyType");
        result.put("tags","tags");
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
    public List<RetrievePolicyPublicResponse> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<RetrievePolicyPublicResponse>>() {});
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("alwaysIncludeDefault", "None");
        result.put("defaultOnEmpty", "None");
        result.put("policyType", "None");
        result.put("tags", "None");
        return result;
    }
}