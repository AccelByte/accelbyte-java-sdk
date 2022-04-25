/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponseV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * TokenGrantV3
 *
 * 
 * 
 * This endpoint supports grant type:
 * 
 * 
 * 
 *                   1. Grant Type == `authorization_code`:
 * 
 *     It generates the user token by given the authorization
 * code which generated in "/v3/oauth/auth" API response. It should also pass
 * in the redirect_uri, which should be the same as generating the
 * authorization code request.
 * 
 * 
 * 
 *                   2. Grant Type == `password`:
 * 
 *     The grant type to use for authenticating a user, whether it's by email / username and password combination
 * or through platform.
 * 
 * 
 * 
 *                   3. Grant Type == `refresh_token`:
 * 
 *     Used to get a new access token for a valid refresh token.
 * 
 * 
 * 
 *                   4. Grant Type == `client_credentials`:
 * 
 *     It generates a token by checking the client credentials provided through Authorization header.
 * 
 * 
 * 
 * 
 * ## Access Token Content
 * 
 * 
 * 
 * 
 * Following is the access tokenâs content:
 * 
 * 
 * 
 * 
 *                   *
 * 
 * 
 * namespace. It is the namespace the token was generated from.
 * 
 * 
 * 
 * 
 * 
 *                   *
 * 
 * 
 * display_name. The display name of the sub. It is empty if the token is generated from the client credential
 * 
 * 
 * 
 * 
 * 
 *                   *
 * 
 * 
 * roles. The subâs roles. It is empty if the token is generated from the client credential
 * 
 * 
 * 
 * 
 * 
 *                   *
 * 
 * 
 * namespace_roles. The subâs roles scoped to namespace. Improvement from roles, which make the role scoped to specific namespace instead of global to publisher namespace
 * 
 * 
 * 
 * 
 * 
 *                   *
 * 
 * 
 * permissions. The sub or audâ permissions
 * 
 * 
 * 
 * 
 * 
 *                   *
 * 
 * 
 * bans. The subâs list of bans. It is used by the IAM client for validating the token.
 * 
 * 
 * 
 * 
 * 
 *                   *
 * 
 * 
 * jflgs. It stands for Justice Flags. It is a special flag used for storing additional status information regarding the sub. It is implemented as a bit mask. Following explains what each bit represents:
 * 
 * 
 * 
 * 
 *                     * 1: Email Address Verified
 * 
 * 
 * 
 *                     * 2: Phone Number Verified
 * 
 * 
 * 
 *                     * 4: Anonymous
 * 
 * 
 * 
 *                     * 8: Suspicious Login
 * 
 * 
 * 
 * 
 * 
 * 
 *                   *
 * 
 * 
 * aud. The aud is the targeted resource server.
 * 
 * 
 * 
 * 
 * 
 *                   *
 * 
 * 
 * iat. The time the token issues at. It is in Epoch time format
 * 
 * 
 * 
 * 
 * 
 *                   *
 * 
 * 
 * exp. The time the token expires. It is in Epoch time format
 * 
 * 
 * 
 * 
 * 
 *                   *
 * 
 * 
 * client_id. The UserID. The sub is omitted if the token is generated from client credential
 * 
 * 
 * 
 * 
 * 
 *                   *
 * 
 * 
 * scope. The scope of the access request, expressed as a list of space-delimited, case-sensitive strings
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * ## Bans
 * 
 * 
 * 
 * 
 * The JWT contains user's active bans with its expiry date. List of ban types can be obtained from /bans.
 * 
 * 
 * 
 * 
 * ## Track Login History
 * 
 * 
 * 
 * 
 * This endpoint will track login history to detect suspicious login activity, please provide "device_id" (alphanumeric) in request header parameter otherwise we will set to "unknown".
 * 
 * 
 * 
 * 
 * Align with General Data Protection Regulation in Europe, user login history will be kept within 28 days by default"
 * 
 * 
 * 
 * 
 * action code: 10703
 */
@Getter
@Setter
public class TokenGrantV3 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/oauth/token";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Basic";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String clientId;
    private String code;
    private String codeVerifier;
    private Boolean extendExp;
    private String password;
    private String redirectUri;
    private String refreshToken;
    private String username;
    private String grantType;

    /**
    * @param grantType required
    */
    @Builder
    public TokenGrantV3(
            String clientId,
            String code,
            String codeVerifier,
            Boolean extendExp,
            String password,
            String redirectUri,
            String refreshToken,
            String username,
            String grantType
    )
    {
        this.clientId = clientId;
        this.code = code;
        this.codeVerifier = codeVerifier;
        this.extendExp = extendExp;
        this.password = password;
        this.redirectUri = redirectUri;
        this.refreshToken = refreshToken;
        this.username = username;
        this.grantType = grantType;
        
        securities.add("Basic");
    }

    public TokenGrantV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }





    @Override
    public Map<String, Object> getFormDataParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.clientId != null) {
            formDataParams.put("client_id", this.clientId);
        }
        if (this.code != null) {
            formDataParams.put("code", this.code);
        }
        if (this.codeVerifier != null) {
            formDataParams.put("code_verifier", this.codeVerifier);
        }
        if (this.extendExp != null) {
            formDataParams.put("extend_exp", this.extendExp == null ? null : String.valueOf(this.extendExp));
        }
        if (this.password != null) {
            formDataParams.put("password", this.password);
        }
        if (this.redirectUri != null) {
            formDataParams.put("redirect_uri", this.redirectUri);
        }
        if (this.refreshToken != null) {
            formDataParams.put("refresh_token", this.refreshToken);
        }
        if (this.username != null) {
            formDataParams.put("username", this.username);
        }
        if (this.grantType != null) {
            formDataParams.put("grant_type", this.grantType);
        }
        return formDataParams;
    }

    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.grantType == null) {
            return false;
        }
        return true;
    }

    @Override
    public OauthmodelTokenResponseV3 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OauthmodelTokenResponseV3().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}