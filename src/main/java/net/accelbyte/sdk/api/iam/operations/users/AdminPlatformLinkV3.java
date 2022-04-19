/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

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
 * AdminPlatformLinkV3
 *
 * 
 * 
 * Required permission 'ADMIN:NAMESPACE:{namespace}:USER:{userId} [UPDATE]'.
 * 
 * 
 * 
 * 
 * 
 * Prerequisite: Platform client configuration need to be added to database for specific platformId. Namespace service URL need to be specified (refer to required environment variables).
 * 
 * 
 * ## Supported platforms:
 * 
 * 
 * 
 * 
 *                 * steam : The ticketâs value is the authentication code returned by Steam.
 * 
 * 
 *                 * steamopenid : Steam's user authentication method using OpenID 2.0. The ticket's value is URL generated by Steam on web authentication
 * 
 * 
 *                 * facebook : The ticketâs value is the authorization code returned by Facebook OAuth
 * 
 * 
 *                 * google : The ticketâs value is the authorization code returned by Google OAuth
 * 
 * 
 *                 * oculus : The ticketâs value is a string composed of Oculus's user ID and the nonce separated by a colon (:).
 * 
 * 
 *                 * twitch : The ticketâs value is the authorization code returned by Twitch OAuth.
 * 
 * 
 *                 * android : The ticket's value is the Androidâs device ID
 * 
 * 
 *                 * ios : The ticket's value is the iOSâs device ID.
 * 
 * 
 *                 * apple : The ticketâs value is the authorization code returned by Apple OAuth.
 * 
 * 
 *                 * device : Every device that doesânt run Android and iOS is categorized as a device platform. The ticket's value is the deviceâs ID.
 * 
 * 
 *                 * discord : The ticketâs value is the authorization code returned by Discord OAuth.
 * 
 * 
 *                 * awscognito : The ticketâs value is the aws cognito access token (JWT).
 * 
 * 
 *                 * epicgames : The ticketâs value is an access-token obtained from Epicgames EOS Account Service.
 * 
 * 
 *                 * nintendo : The ticketâs value is the authorization code(id_token) returned by Nintendo OAuth.
 * 
 * 
 *                 * stadia : The ticketâs value is a JWT Token, which can be obtained after calling the Stadia SDK's function.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminPlatformLinkV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/admin/namespaces/{namespace}/users/{userId}/platforms/{platformId}/link";

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
    private String namespace;
    private String platformId;
    private String userId;
    private String ticket;

    /**
    * @param namespace required
    * @param platformId required
    * @param userId required
    * @param ticket required
    */
    @Builder
    public AdminPlatformLinkV3(
            String namespace,
            String platformId,
            String userId,
            String ticket
    )
    {
        this.namespace = namespace;
        this.platformId = platformId;
        this.userId = userId;
        this.ticket = ticket;
    }

    @JsonIgnore
    public AdminPlatformLinkV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.platformId != null){
            pathParams.put("platformId", this.platformId);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }



    @Override
    @JsonIgnore
    public Map<String, Object> getFormDataParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.ticket != null) {
            formDataParams.put("ticket", this.ticket);
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
        result.put("namespace","namespace");
        result.put("platformId","platformId");
        result.put("userId","userId");
        result.put("ticket","ticket");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "platformId",
            "userId",
            "ticket"        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.platformId == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        if(this.ticket == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}