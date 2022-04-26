/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.clients;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ClientmodelClientV3Response;
import net.accelbyte.sdk.api.iam.models.ClientmodelClientCreationV3Request;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminCreateClientV3
 *
 * Add a new OAuth 2.0 client. Protected by the permission: ADMIN:NAMESPACE:{namespace}:CLIENT [CREATE]
 * 
 * A new client automatically granted with these scopes: commerce, account, analytics, publishing, social.
 * 
 * action code: 10301
 * 
 * 
 * 
 * Fields Description:
 * 
 * 
 *           * clientId : The client ID. e.g f815e5c44f364993961be3b3f26a7bf4
 * 
 * 
 *           * clientName : The client name. e.g E-commerce
 * 
 * 
 *           * secret : The client's secret. It's empty if the client's type is a public client. Otherwise, the client secret is required
 * 
 * 
 *           * namespace : The namespace where the client lives. e.g sample-game
 * 
 * 
 *           * redirectUri : Contains the redirect URI used in OAuth callback. e.g https://example.net/platform
 * 
 * 
 *           * oauthClientType : The OAuth 2.0 client type. The client type determines whether the authorization needs Proof Of Key Exchange or not.
 * A public client type doesn't have a client secret and should use PKCE flow.
 * A confidential client type has a client secret and don't use PKCE flow
 * Supported oAuthClientType :
 * 
 *             * Public
 * 
 * 
 *             * Confidential
 * 
 * 
 *           * audiences : List of target client IDs who is intended to receive the token. e.g ["eaaa65618fe24293b00a61454182b435", "40073ee9bc3446d3a051a71b48509a5d"]
 * 
 * 
 *           * baseUri : A base URI of the application. It is used for making sure the token is intended to be used by the client. e.g https://example.net/platform
 * 
 * 
 *           * clientPermissions : Contains the client's permissions
 * 
 * 
 *           * deletable : The flag to identify whether client is deletable (optional). default value: true
 */
@Getter
@Setter
public class AdminCreateClientV3 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/admin/namespaces/{namespace}/clients";
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
    private ClientmodelClientCreationV3Request body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public AdminCreateClientV3(
            String namespace,
            ClientmodelClientCreationV3Request body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public AdminCreateClientV3 createFromJson(String json) throws JsonProcessingException {
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
        return pathParams;
    }



    @Override
    public ClientmodelClientCreationV3Request getBodyParams(){
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
        return true;
    }

    public ClientmodelClientV3Response parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ClientmodelClientV3Response().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}