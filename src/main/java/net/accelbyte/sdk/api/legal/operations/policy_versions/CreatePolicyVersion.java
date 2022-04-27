/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.policy_versions;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.models.CreatePolicyVersionResponse;
import net.accelbyte.sdk.api.legal.models.CreatePolicyVersionRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * createPolicyVersion
 *
 * Create a version of a particular country-specific policy.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=1 (CREATE)
 */
@Getter
@Setter
public class CreatePolicyVersion extends Operation {
    /**
     * generated field's value
     */
    private String path = "/agreement/admin/policies/{policyId}/versions";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String policyId;
    private CreatePolicyVersionRequest body;

    /**
    * @param policyId required
    */
    @Builder
    public CreatePolicyVersion(
            String policyId,
            CreatePolicyVersionRequest body
    )
    {
        this.policyId = policyId;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.policyId != null){
            pathParams.put("policyId", this.policyId);
        }
        return pathParams;
    }



    @Override
    public CreatePolicyVersionRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.policyId == null) {
            return false;
        }
        return true;
    }

    public CreatePolicyVersionResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 201){
            return new CreatePolicyVersionResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}