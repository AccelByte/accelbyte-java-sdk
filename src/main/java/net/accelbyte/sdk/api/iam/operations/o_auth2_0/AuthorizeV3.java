/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AuthorizeV3
 *
 * Initializes OAuth2.0 authorization code flow
 * 
 * 
 * 
 * The endpoint stores authorization request and redirects to login page with the authorization request id.
 * The user can then do the authentication on the login page.
 * The user will be redirected back to the requesting client with authorization code if successfully authenticated.
 * 
 * 
 * 
 * 
 * 
 * Only authorization code flow supported by this endpoint, implicit flow is not supported.
 * 
 * 
 * 
 * 
 *                 * Authorize success :
 * redirects to login page with the following information: ?request_id={authorization_request_id}
 * 
 * 
 * 
 * 
 * 
 *                 * Authorize failure :
 * redirects to the given redirect uri with the following information:
 * ?error={error_code}&error;_description={error description}
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * Following are the error code based on the specification:
 * 
 * 
 * 
 * 
 *                 * invalid_request: The request is missing a required parameter,
 * includes an invalid parameter value, includes a parameter more than once, or is otherwise malformed.
 * 
 * 
 * 
 * 
 * 
 *                 * server_error:
 * The authorization server encountered an unexpected condition that prevented it from fulfilling the request.
 * 
 * 
 * 
 * 
 * 
 *                 * unauthorized_client: The client is not authorized to request a token using this method.
 * 
 * 
 * 
 *                 * access_denied: The resource owner or authorization server denied the request.
 * 
 * 
 * 
 *                 * invalid_scope: The requested scope is invalid, unknown, or malformed.
 * 
 * 
 * 
 *                 * unsupported_response_type: The authorization server does not support obtaining a token using this method.
 * 
 * 
 * 
 *                 * temporarily_unavailable: The authorization server is currently unable to handle the request
 * due to a temporary overloading or maintenance of the server.
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * Please refer to the RFC for more information about authorization code flow: https://tools.ietf.org/html/rfc6749#section-4.1
 * 
 * 
 * 
 * action code: 10701
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AuthorizeV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/oauth/authorize";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Basic";

    @JsonIgnore
    private String locationQuery = "request_id";

    /**
     * fields as input parameter
     */
    private String codeChallenge;
    private String codeChallengeMethod;
    private String redirectUri;
    private String scope;
    private String state;
    private String targetAuthPage;
    private String clientId;
    private String responseType;

    /**
    * @param clientId required
    * @param responseType required
    */
    @Builder
    public AuthorizeV3(
            String codeChallenge,
            String codeChallengeMethod,
            String redirectUri,
            String scope,
            String state,
            String targetAuthPage,
            String clientId,
            String responseType
    )
    {
        this.codeChallenge = codeChallenge;
        this.codeChallengeMethod = codeChallengeMethod;
        this.redirectUri = redirectUri;
        this.scope = scope;
        this.state = state;
        this.targetAuthPage = targetAuthPage;
        this.clientId = clientId;
        this.responseType = responseType;
    }

    @JsonIgnore
    public AuthorizeV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }


    @Override
    @JsonIgnore
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("code_challenge", this.codeChallenge == null ? null : Arrays.asList(this.codeChallenge));
        queryParams.put("code_challenge_method", this.codeChallengeMethod == null ? null : Arrays.asList(this.codeChallengeMethod));
        queryParams.put("redirect_uri", this.redirectUri == null ? null : Arrays.asList(this.redirectUri));
        queryParams.put("scope", this.scope == null ? null : Arrays.asList(this.scope));
        queryParams.put("state", this.state == null ? null : Arrays.asList(this.state));
        queryParams.put("target_auth_page", this.targetAuthPage == null ? null : Arrays.asList(this.targetAuthPage));
        queryParams.put("client_id", this.clientId == null ? null : Arrays.asList(this.clientId));
        queryParams.put("response_type", this.responseType == null ? null : Arrays.asList(this.responseType));
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("code_challenge","codeChallenge");
        result.put("code_challenge_method","codeChallengeMethod");
        result.put("redirect_uri","redirectUri");
        result.put("scope","scope");
        result.put("state","state");
        result.put("target_auth_page","targetAuthPage");
        result.put("client_id","clientId");
        result.put("response_type","responseType");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(






            "clientId",
            "responseType"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.clientId == null) {
            return false;
        }
        if(this.responseType == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public String parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code != 302){
            throw new ResponseException(code, json);
        }
        return json;
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("code_challenge", "None");
        result.put("code_challenge_method", "None");
        result.put("redirect_uri", "None");
        result.put("scope", "None");
        result.put("state", "None");
        result.put("target_auth_page", "None");
        result.put("client_id", "None");
        result.put("response_type", "None");
        return result;
    }
}