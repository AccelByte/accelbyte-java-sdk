/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.sso_credential;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelSSOPlatformCredentialResponse;
import net.accelbyte.sdk.api.iam.models.ModelSSOPlatformCredentialRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AddSSOLoginPlatformCredential
 *
 * This is the API to Add SSO Platform Credential. It needs ADMIN:NAMESPACE:{namespace}:PLATFORM:{platformId}:SSO [CREATE] resource.
 * 
 * ## Supported platforms:
 * 
 * 
 * 
 *           * discourse
 * the ssoUrl of the discourse is the discourse forum url. example: https://forum.example.com
 * 
 *           * azure with SAML
 *  appId is an application identifier in IdP, in azure it's called EntityID
 * acsUrl is an endpoint on the service provider where the identity provider will redirect to with its authentication response. example: /iam/v3/sso/saml/azuresaml/authenticate
 * federationMetadataUrl is an endpoint on the Identity Provider(IdP) to get IdP federation metadata for service provider to build trust relationship
 */
@Getter
@Setter
public class AddSSOLoginPlatformCredential extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/sso";
    private String method = "POST";
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
    private ModelSSOPlatformCredentialRequest body;

    /**
    * @param namespace required
    * @param platformId required
    * @param body required
    */
    @Builder
    public AddSSOLoginPlatformCredential(
            String namespace,
            String platformId,
            ModelSSOPlatformCredentialRequest body
    )
    {
        this.namespace = namespace;
        this.platformId = platformId;
        this.body = body;
        
        securities.add("Bearer");
    }

    public AddSSOLoginPlatformCredential createFromJson(String json) throws JsonProcessingException {
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
    public ModelSSOPlatformCredentialRequest getBodyParams(){
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
    public ModelSSOPlatformCredentialResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelSSOPlatformCredentialResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}