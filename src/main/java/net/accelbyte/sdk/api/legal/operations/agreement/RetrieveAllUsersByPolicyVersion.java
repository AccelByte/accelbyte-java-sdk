/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.agreement;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * retrieveAllUsersByPolicyVersion
 *
 * This API will return all users who has accepted a specific policy version.Other detail info:
 *   * Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=2 (READ)
 */
@Getter
@Setter
public class RetrieveAllUsersByPolicyVersion extends Operation {
    /**
     * generated field's value
     */
    private String url = "/agreement/admin/agreements/policy-versions/users";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String keyword;
    private Integer limit;
    private Integer offset;
    private String policyVersionId;

    /**
    * @param policyVersionId required
    */
    @Builder
    public RetrieveAllUsersByPolicyVersion(
            String keyword,
            Integer limit,
            Integer offset,
            String policyVersionId
    )
    {
        this.keyword = keyword;
        this.limit = limit;
        this.offset = offset;
        this.policyVersionId = policyVersionId;
        
        securities.add("Bearer");
    }


    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("keyword", this.keyword == null ? null : Arrays.asList(this.keyword));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("policyVersionId", this.policyVersionId == null ? null : Arrays.asList(this.policyVersionId));
        return queryParams;
    }




    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.policyVersionId == null) {
            return false;
        }
        return true;
    }

    public List<PagedRetrieveUserAcceptedAgreementResponse> parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<PagedRetrieveUserAcceptedAgreementResponse>>() {});
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("keyword", "None");
        result.put("limit", "None");
        result.put("offset", "None");
        result.put("policyVersionId", "None");
        return result;
    }
}