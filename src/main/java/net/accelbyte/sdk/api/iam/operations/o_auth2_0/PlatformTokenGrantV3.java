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
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * PlatformTokenGrantV3
 *
 * 
 * 
 * Platform token grant specifically used for performing token grant using platform, e.g. Steam, Justice, etc. The endpoint automatically create an account if the account associated with the platform is not exists yet.
 * This endpoint requires all requests to have Authorization header set with Basic access authentication
 * constructed from client id and client secret. For publisher-game namespace schema : Specify only either platform_token or device_id. Device token grant
 * should be requested along with device_id parameter against game namespace. Another 3rd party platform token grant should be requested
 * along with platform_token parameter against publisher namespace.
 * 
 * 
 * 
 * 
 * ## Supported platforms:
 * 
 * 
 * 
 * 
 *                 * steam : The platform_tokenâs value is the authentication code returned by Steam.
 * 
 * 
 *                 * steamopenid : Steam's user authentication method using OpenID 2.0. The platform_token's value is URL generated by Steam on web authentication
 * 
 * 
 *                 * facebook : The platform_tokenâs value is the authorization code returned by Facebook OAuth
 * 
 * 
 *                 * google : The platform_tokenâs value is the authorization code returned by Google OAuth
 * 
 * 
 *                 * oculus : The platform_tokenâs value is a string composed of Oculus's user ID and the nonce separated by a colon (:).
 * 
 * 
 *                 * twitch : The platform_tokenâs value is the authorization code returned by Twitch OAuth.
 * 
 * 
 *                 * discord : The platform_tokenâs value is the authorization code returned by Discord OAuth
 * 
 * 
 *                 * android : The device_id is the Androidâs device ID
 * 
 * 
 *                 * ios : The device_id is the iOSâs device ID.
 * 
 * 
 *                 * apple : The platform_tokenâs value is the authorization code returned by Apple OAuth.(We will use this code to generate APP token)
 * 
 * 
 *                 * device : Every device that doesânt run Android and iOS is categorized as a device. The device_id is the deviceâs ID.
 * 
 * 
 *                 * justice : The platform_tokenâs value is the designated userâs access token.
 * 
 * 
 *                 * epicgames : The platform_tokenâs value is an access-token obtained from Epicgames EOS Account Service.
 * 
 * 
 *                 * stadia : The platform_token's value is a JWT Token, which can be obtained after calling the Stadia SDK's function.
 * 
 * 
 *                 * ps4 : The platform_tokenâs value is the authorization code returned by Sony OAuth.
 * 
 * 
 *                 * ps5 : The platform_tokenâs value is the authorization code returned by Sony OAuth.
 * 
 * 
 *                 * nintendo : The platform_tokenâs value is the authorization code(id_token) returned by Nintendo OAuth.
 * 
 * 
 *                 * awscognito : The platform_tokenâs value is the aws cognito access token or id token (JWT).
 * 
 * 
 *                 * xbl : The platform_tokenâs value is XSTS token
 * 
 * 
 *                 * xblweb : The platform_tokenâs value is code returned by xbox after login
 * 
 * 
 * 
 * 
 * ## Account Group
 * 
 * 
 * 
 * 
 * Several platforms are grouped under account groups. The accounts on these platforms have the same platform user id.
 * Login using one of these platform will returns the same IAM user.
 * 
 * 
 * 
 * 
 * Following is the current registered account grouping:
 * 
 * 
 * 
 * 
 *                 * (psn) ps4web
 * 
 * 
 *                 * (psn) ps4
 * 
 * 
 *                 * (psn) ps5
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
 *                 *
 * 
 * 
 * namespace. It is the namespace the token was generated from.
 * 
 * 
 * 
 * 
 * 
 *                 *
 * 
 * 
 * display_name. The display name of the sub. It is empty if the token is generated from the client credential
 * 
 * 
 * 
 * 
 * 
 *                 *
 * 
 * 
 * roles. The subâs roles. It is empty if the token is generated from the client credential
 * 
 * 
 * 
 * 
 * 
 *                 *
 * 
 * 
 * namespace_roles. The subâs roles scoped to namespace. Improvement from roles, which make the role scoped to specific namespace instead of global to publisher namespace
 * 
 * 
 * 
 * 
 * 
 *                 *
 * 
 * 
 * permissions. The sub or audâ permissions
 * 
 * 
 * 
 * 
 * 
 *                 *
 * 
 * 
 * bans. The subâs list of bans. It is used by the IAM client for validating the token.
 * 
 * 
 * 
 * 
 * 
 *                 *
 * 
 * 
 * jflgs. It stands for Justice Flags. It is a special flag used for storing additional status information regarding the sub. It is implemented as a bit mask. Following explains what each bit represents:
 * 
 * 
 * 
 * 
 *                   * 1: Email Address Verified
 * 
 * 
 * 
 *                   * 2: Phone Number Verified
 * 
 * 
 * 
 *                   * 4: Anonymous
 * 
 * 
 * 
 *                   * 8: Suspicious Login
 * 
 * 
 * 
 * 
 * 
 * 
 *                 *
 * 
 * 
 * aud. The aud is the client ID.
 * 
 * 
 * 
 * 
 * 
 *                 *
 * 
 * 
 * iat. The time the token issues at. It is in Epoch time format
 * 
 * 
 * 
 * 
 * 
 *                 *
 * 
 * 
 * exp. The time the token expires. It is in Epoch time format
 * 
 * 
 * 
 * 
 * 
 *                 *
 * 
 * 
 * sub. The UserID. The sub is omitted if the token is generated from client credential
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
 * action code : 10704
 */
@Getter
@Setter
public class PlatformTokenGrantV3 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/oauth/platforms/{platformId}/token";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Basic";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String platformId;
    private String clientId;
    private String deviceId;
    private String platformToken;

    /**
    * @param platformId required
    */
    @Builder
    public PlatformTokenGrantV3(
            String platformId,
            String clientId,
            String deviceId,
            String platformToken
    )
    {
        this.platformId = platformId;
        this.clientId = clientId;
        this.deviceId = deviceId;
        this.platformToken = platformToken;
        
        securities.add("Basic");
    }

    public PlatformTokenGrantV3 createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.clientId != null) {
            formDataParams.put("client_id", this.clientId);
        }
        if (this.deviceId != null) {
            formDataParams.put("device_id", this.deviceId);
        }
        if (this.platformToken != null) {
            formDataParams.put("platform_token", this.platformToken);
        }
        return formDataParams;
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
        return true;
    }

    @Override
    public OauthmodelTokenResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OauthmodelTokenResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}