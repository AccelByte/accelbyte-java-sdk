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
import net.accelbyte.sdk.api.iam.models.ModelThirdPartyLoginPlatformCredentialResponse;
import net.accelbyte.sdk.api.iam.models.ModelThirdPartyLoginPlatformCredentialRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AddThirdPartyLoginPlatformCredentialV3
 *
 * 
 * 
 * This is the API to Add 3rd Platform Credential.
 * 
 * 
 * 
 * 
 * It needs ADMIN:NAMESPACE:{namespace}:PLATFORM:{platformId}:CLIENT [CREATE] resource.
 * 
 * 
 * 
 * 
 * The secret for apple is base64 encoded private key.
 * 
 * 
 * 
 * 
 * If generic oauth flow is set to true:
 * 
 * 
 * 
 * 
 *           * Current supported value for TokenAuthenticationType is idToken
 * 
 * 
 *           * `TokenClaimsMapping` is used to extract user info from idToken claims.
 * Its a JSON format with key should be `name`, `email` and `avatarUrl`
 * since IAM will look up for these key when extracting user info.
 */
@Getter
@Setter
public class AddThirdPartyLoginPlatformCredentialV3 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/clients";
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
    private ModelThirdPartyLoginPlatformCredentialRequest body;

    /**
    * @param namespace required
    * @param platformId required
    * @param body required
    */
    @Builder
    public AddThirdPartyLoginPlatformCredentialV3(
            String namespace,
            String platformId,
            ModelThirdPartyLoginPlatformCredentialRequest body
    )
    {
        this.namespace = namespace;
        this.platformId = platformId;
        this.body = body;
        
        securities.add("Bearer");
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
    public ModelThirdPartyLoginPlatformCredentialRequest getBodyParams(){
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

    public ModelThirdPartyLoginPlatformCredentialResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelThirdPartyLoginPlatformCredentialResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}