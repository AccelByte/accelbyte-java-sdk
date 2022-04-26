/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.sso_saml_2_0;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * platformAuthenticateSAMLV3Handler
 *
 * This endpoint authenticates user platform for SAML protocol. It validates user to its
 * respective platforms. Deactivated or login-banned users are unable to login.
 * 
 * 
 * 
 * ## Supported platforms:
 * 
 * 
 * 
 *                           * azure
 * Microsoft login page will redirects to this endpoint after login success
 * as previously defined on authentication request SAML
 */
@Getter
@Setter
public class PlatformAuthenticateSAMLV3Handler extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/sso/saml/platforms/{platformId}/authenticate";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
    private List<String> produces = Arrays.asList();
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = "PLACEHOLDER";
    /**
     * fields as input parameter
     */
    private String platformId;
    private String code;
    private String error;
    private String state;

    /**
    * @param platformId required
    * @param state required
    */
    @Builder
    public PlatformAuthenticateSAMLV3Handler(
            String platformId,
            String code,
            String error,
            String state
    )
    {
        this.platformId = platformId;
        this.code = code;
        this.error = error;
        this.state = state;
        
        securities.add("Bearer");
    }

    public PlatformAuthenticateSAMLV3Handler createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.platformId != null){
            pathParams.put("platformId", this.platformId);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("code", this.code == null ? null : Arrays.asList(this.code));
        queryParams.put("error", this.error == null ? null : Arrays.asList(this.error));
        queryParams.put("state", this.state == null ? null : Arrays.asList(this.state));
        return queryParams;
    }




    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.platformId == null) {
            return false;
        }
        if(this.state == null) {
            return false;
        }
        return true;
    }

    @Override
    public String parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code != 302){
            throw new HttpResponseException(code, json);
        }
        return json;
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("code", "None");
        result.put("error", "None");
        result.put("state", "None");
        return result;
    }
}