/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.third_party_credential;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelPlatformDomainResponse;
import net.accelbyte.sdk.api.iam.models.ModelPlatformDomainUpdateRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * UpdateThirdPartyLoginPlatformDomainV3
 *
 * 
 * 
 * This is the API to set 3rd Platform domain.
 * 
 * 
 * 
 * 
 * It needs ADMIN:NAMESPACE:{namespace}:CLIENTDOMAIN [UPDATE] resource.
 */
@Getter
@Setter
public class UpdateThirdPartyLoginPlatformDomainV3 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/clients/domain";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String platformId;
    private ModelPlatformDomainUpdateRequest body;

    /**
    * @param namespace required
    * @param platformId required
    * @param body required
    */
    @Builder
    public UpdateThirdPartyLoginPlatformDomainV3(
            String namespace,
            String platformId,
            ModelPlatformDomainUpdateRequest body
    )
    {
        this.namespace = namespace;
        this.platformId = platformId;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateThirdPartyLoginPlatformDomainV3 createFromJson(String json) throws JsonProcessingException {
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
        if (this.platformId != null){
            pathParams.put("platformId", this.platformId);
        }
        return pathParams;
    }



    @Override
    public ModelPlatformDomainUpdateRequest getBodyParams(){
        return this.body;
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
        if(this.platformId == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelPlatformDomainResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelPlatformDomainResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}