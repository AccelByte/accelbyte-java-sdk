/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.policy_versions;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.models.UpdatePolicyVersionResponse;
import net.accelbyte.sdk.api.legal.models.UpdatePolicyVersionRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updatePolicyVersion
 *
 * Update a particular policy version.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=4 (UPDATE)
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class UpdatePolicyVersion extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/agreement/admin/policies/versions/{policyVersionId}";

    @JsonIgnore
    private String method = "PATCH";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private String policyVersionId;
    private UpdatePolicyVersionRequest body;

    /**
    * @param policyVersionId required
    */
    @Builder
    public UpdatePolicyVersion(
            String policyVersionId,
            UpdatePolicyVersionRequest body
    )
    {
        this.policyVersionId = policyVersionId;
        this.body = body;
    }

    @JsonIgnore
    public UpdatePolicyVersion createFromJson(String json) throws JsonProcessingException {
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
        if (this.policyVersionId != null){
            pathParams.put("policyVersionId", this.policyVersionId);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public UpdatePolicyVersionRequest getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("policyVersionId","policyVersionId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "policyVersionId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.policyVersionId == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public UpdatePolicyVersionResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new UpdatePolicyVersionResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}