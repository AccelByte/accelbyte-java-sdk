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
import net.accelbyte.sdk.api.legal.models.UpdateLocalizedPolicyVersionResponse;
import net.accelbyte.sdk.api.legal.models.UpdateLocalizedPolicyVersionRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updateLocalizedPolicyVersion
 *
 * Update a version of a particular country-specific policy.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=4 (UPDATE)
 */
@Getter
@Setter
public class UpdateLocalizedPolicyVersion extends Operation {
    /**
     * generated field's value
     */
    private String url = "/agreement/admin/localized-policy-versions/{localizedPolicyVersionId}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String localizedPolicyVersionId;
    private UpdateLocalizedPolicyVersionRequest body;

    /**
    * @param localizedPolicyVersionId required
    */
    @Builder
    public UpdateLocalizedPolicyVersion(
            String localizedPolicyVersionId,
            UpdateLocalizedPolicyVersionRequest body
    )
    {
        this.localizedPolicyVersionId = localizedPolicyVersionId;
        this.body = body;
        
        securities.add("Bearer");
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
    public UpdateLocalizedPolicyVersionRequest getBodyParams(){
        return this.body;
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

    public UpdateLocalizedPolicyVersionResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new UpdateLocalizedPolicyVersionResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}