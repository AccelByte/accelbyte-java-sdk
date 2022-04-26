/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.base_legal_policies;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.models.UpdateBasePolicyResponse;
import net.accelbyte.sdk.api.legal.models.UpdateBasePolicyRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * partialUpdatePolicy
 *
 * Update an existing base policy.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=4 (UPDATE)
 */
@Getter
@Setter
public class PartialUpdatePolicy extends Operation {
    /**
     * generated field's value
     */
    private String url = "/agreement/admin/base-policies/{basePolicyId}";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String basePolicyId;
    private UpdateBasePolicyRequest body;

    /**
    * @param basePolicyId required
    */
    @Builder
    public PartialUpdatePolicy(
            String basePolicyId,
            UpdateBasePolicyRequest body
    )
    {
        this.basePolicyId = basePolicyId;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.basePolicyId != null){
            pathParams.put("basePolicyId", this.basePolicyId);
        }
        return pathParams;
    }



    @Override
    public UpdateBasePolicyRequest getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.basePolicyId == null) {
            return false;
        }
        return true;
    }

    public UpdateBasePolicyResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new UpdateBasePolicyResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}