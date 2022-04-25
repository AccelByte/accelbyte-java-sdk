/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.localized_policy_versions;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.models.RetrieveLocalizedPolicyVersionPublicResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * retrieveSingleLocalizedPolicyVersion_1
 *
 * Retrieve specific localized policy version including the policy version and base policy version where the localized policy version located.
 * Other detail info:
 */
@Getter
@Setter
public class RetrieveSingleLocalizedPolicyVersion1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/agreement/public/localized-policy-versions/{localizedPolicyVersionId}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String localizedPolicyVersionId;

    /**
    * @param localizedPolicyVersionId required
    */
    @Builder
    public RetrieveSingleLocalizedPolicyVersion1(
            String localizedPolicyVersionId
    )
    {
        this.localizedPolicyVersionId = localizedPolicyVersionId;
        
    }

    public RetrieveSingleLocalizedPolicyVersion1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.localizedPolicyVersionId != null){
            pathParams.put("localizedPolicyVersionId", this.localizedPolicyVersionId);
        }
        return pathParams;
    }





    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.localizedPolicyVersionId == null) {
            return false;
        }
        return true;
    }

    @Override
    public RetrieveLocalizedPolicyVersionPublicResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new RetrieveLocalizedPolicyVersionPublicResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}