/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * TokenGrant
 *
 * 
 * 
 * This endpoint requires all requests to have `Authorization` header set with `Basic` access authentication
 * constructed from client id and client secret.
 * 
 * 
 * 
 * 
 * This endpoint supports different grant types :
 * 
 * 
 * 
 *         1. Grant Type == `client_credentials`:
 * 
 *     This endpoint will check the client credentials provided through Authorization header.
 * 
 * 
 *         2. Grant Type == `password`:
 * 
 *     The grant type to use for authenticating a user, whether it's by email / username and password combination
 * or through platform.
 * 
 * 
 *         3. Grant Type == `refresh_token`:
 * 
 *     Used to get a new access token for a valid refresh token.
 * 
 * 
 *         4. Grant Type == `authorization_code`:
 * 
 *     It generates the user token by given the authorization
 * code which generated in "/authorize" API response. It should also pass
 * in the redirect_uri, which should be the same as generating the
 * authorization code request.
 * 
 * 
 * 
 * For platform authentication, use grant type `password`.
 * The `username` field would be in form of
 * `platform:<platform type>`, for example
 * `platform:steam` for Steam. For the `password`
 * field, set it to the authentication/authorization ticket or token obtainable through the
 * respective platform SDK after authenticated the user to the platform. Supported platforms:
 * 
 * 
 * 
 *         * steam - use `platform:steam` as the username and use the authentication ticket obtained
 * from Steam through the Steam SDK as the password.
 * 
 * 
 *         * ps4 - use `platform:ps4` as the username and use the authorization code
 * obtained from the PlayStation Network through a player PS4 unit as the password.
 * 
 * 
 *         * live - use `platform:live` as the username and use token obtained from
 * Xbox Secure Token Service (XSTS) as the password.
 * 
 * 
 *         * oculus - use `platform:oculus` as the username and use the `user_id:nonce`
 * as password obtained from Oculus through the Oculus SDK.
 * 
 * 
 * 
 * 
 * The access token and refresh token are in form of JWT token.
 * An access token JWT contains data which structure is similar to the
 * Response Class below, but without OAuth-related data. To verify a token, use the public keys
 * obtained from the `/jwks` endpoint below.
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
 *         *
 * 
 * 
 * namespace. It is the namespace the token was generated from.
 * 
 * 
 * 
 * 
 * 
 *         *
 * 
 * 
 * display_name. The display name of the sub. It is empty if the token is generated from the client credential
 * 
 * 
 * 
 * 
 * 
 *         *
 * 
 * 
 * roles. The subâs roles. It is empty if the token is generated from the client credential
 * 
 * 
 * 
 * 
 * 
 *         *
 * 
 * 
 * namespace_roles. The subâs roles scoped to namespace. Improvement from roles, which make the role scoped to specific namespace instead of global to publisher namespace
 * 
 * 
 * 
 * 
 * 
 *         *
 * 
 * 
 * permissions. The sub or audâ permissions
 * 
 * 
 * 
 * 
 * 
 *         *
 * 
 * 
 * bans. The subâs list of bans. It is used by the IAM client for validating the token.
 * 
 * 
 * 
 * 
 * 
 *         *
 * 
 * 
 * jflgs. It stands for Justice Flags. It is a special flag used for storing additional status information regarding the sub. It is implemented as a bit mask. Following explains what each bit represents:
 * 
 * 
 * 
 * 
 *           * 1: Email Address Verified
 * 
 * 
 * 
 *           * 2: Phone Number Verified
 * 
 * 
 * 
 *           * 4: Anonymous
 * 
 * 
 * 
 * 
 * 
 * 
 *         *
 * 
 * 
 * aud. The aud is the client ID.
 * 
 * 
 * 
 * 
 * 
 *         *
 * 
 * 
 * iat. The time the token issues at. It is in Epoch time format
 * 
 * 
 * 
 * 
 * 
 *         *
 * 
 * 
 * exp. The time the token expires. It is in Epoch time format
 * 
 * 
 * 
 * 
 * 
 *         *
 * 
 * 
 * sub. The UserID. The sub is omitted if the token is generated from client credential
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
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class TokenGrant extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/oauth/token";

    @JsonIgnore
    private String method = "POST";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private String code;
    private Boolean extendExp;
    private String namespace;
    private String password;
    private String redirectUri;
    private String refreshToken;
    private String username;
    private String grantType;

    /**
    * @param grantType required
    */
    @Builder
    public TokenGrant(
            String code,
            Boolean extendExp,
            String namespace,
            String password,
            String redirectUri,
            String refreshToken,
            String username,
            String grantType
    )
    {
        this.code = code;
        this.extendExp = extendExp;
        this.namespace = namespace;
        this.password = password;
        this.redirectUri = redirectUri;
        this.refreshToken = refreshToken;
        this.username = username;
        this.grantType = grantType;
    }

    @JsonIgnore
    public TokenGrant createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }




    @Override
    @JsonIgnore
    public Map<String, Object> getFormDataParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.code != null) {
            formDataParams.put("code", this.code);
        }
        if (this.extendExp != null) {
            formDataParams.put("extend_exp", this.extendExp == null ? null : String.valueOf(this.extendExp));
        }
        if (this.namespace != null) {
            formDataParams.put("namespace", this.namespace);
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
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("code","code");
        result.put("extend_exp","extendExp");
        result.put("namespace","namespace");
        result.put("password","password");
        result.put("redirect_uri","redirectUri");
        result.put("refresh_token","refreshToken");
        result.put("username","username");
        result.put("grant_type","grantType");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "grantType"        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.grantType == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public OauthmodelTokenResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OauthmodelTokenResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}