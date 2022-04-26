/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth;

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
 * Authorization
 *
 * The endpoint supports two response types:
 * 
 * 
 * 
 * 1. Response Type == "code":
 * 
 * 
 * 
 * 
 * The endpoint returns an authorization code that will be used by the IAM client to exchange for an access token. It supports two different headers, the basic and the bearer header. Each behaves differently.
 * 
 * 
 * 
 * 
 *         *
 * 
 * 
 * The basic header
 * 
 * 
 * 
 * 
 * The basic headerâs value is the base64 of the client ID and client secret. It is used by the developer whenever the developer authorizes a user on a same namespace.
 * 
 * 
 * 
 * 
 * 
 *         *
 * 
 * 
 * The bearer header
 * 
 * 
 * 
 * 
 * The bearer headerâs value is an access token. It is used by the developer whenever the developer authorizes a user on a different namespace. The endpoint validates userâs entitlement on the designated namespace for making sure the user is authorized for a designated namespace.
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * Following are the responses returned by the endpoint:
 * 
 * 
 * 
 * 
 *         *  Authorize success : redirects to the given URL with the following information: ?code={authorization code}&state;={state}
 * 
 * 
 * 
 *         *  Authorize failure : redirects to the given URL with the following information:?error=access_denied&error;_description=...
 * 
 * 
 * 
 * 
 * 
 * 2. Response Type == "token":
 * 
 * 
 * 
 * 
 *         *
 * 
 * 
 * Authorize success : redirects to the given URL with the following information:
 * 
 * 
 * 
 * 
 * #access_token={accesstoken}&expires;_in={expiration duration in seconds}&token;_type=Bearer
 * 
 * 
 * 
 * 
 * 
 *         *
 * 
 * 
 * Authorize failure : redirects to the given URL with the following information:
 * 
 * 
 * 
 * 
 * ?error=access_denied&error;_description=...
 */
@Getter
@Setter
public class Authorization extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/oauth/authorize";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = "PLACEHOLDER";
    /**
     * fields as input parameter
     */
    private String login;
    private String password;
    private String scope;
    private String state;
    private String clientId;
    private String redirectUri;
    private String responseType;

    /**
    * @param clientId required
    * @param redirectUri required
    * @param responseType required
    */
    @Builder
    public Authorization(
            String login,
            String password,
            String scope,
            String state,
            String clientId,
            String redirectUri,
            String responseType
    )
    {
        this.login = login;
        this.password = password;
        this.scope = scope;
        this.state = state;
        this.clientId = clientId;
        this.redirectUri = redirectUri;
        this.responseType = responseType;
        
        securities.add("Bearer");
    }





    @Override
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.login != null) {
            formDataParams.put("login", this.login);
        }
        if (this.password != null) {
            formDataParams.put("password", this.password);
        }
        if (this.scope != null) {
            formDataParams.put("scope", this.scope);
        }
        if (this.state != null) {
            formDataParams.put("state", this.state);
        }
        if (this.clientId != null) {
            formDataParams.put("client_id", this.clientId);
        }
        if (this.redirectUri != null) {
            formDataParams.put("redirect_uri", this.redirectUri);
        }
        if (this.responseType != null) {
            formDataParams.put("response_type", this.responseType);
        }
        return formDataParams;
    }

    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.clientId == null) {
            return false;
        }
        if(this.redirectUri == null) {
            return false;
        }
        if(this.responseType == null) {
            return false;
        }
        return true;
    }

    public String parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code != 302){
            throw new HttpResponseException(code, json);
        }
        return json;
    }

}