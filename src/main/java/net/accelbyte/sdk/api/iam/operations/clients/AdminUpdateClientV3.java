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
import net.accelbyte.sdk.api.iam.models.ClientmodelClientUpdateV3Request;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminUpdateClientV3
 *
 * Updates an OAuth 2.0 client. Protected by the permission: ADMIN:NAMESPACE:{namespace}:CLIENT [UPDATE].
 * Specify only the fields you want to update in the request payload, e.g. {"ClientName":"E-commerce", "BaseUri":"https://example.net"}
 * 
 * action code: 10302
 * 
 * 
 * 
 * Fields Description:
 * 
 * 
 *           * clientName : The client name. It should not be empty if the field exists in the body. e.g E-commerce
 * 
 * 
 *           * namespace : The namespace where the client lives. e.g sample-game
 * 
 * 
 *           * redirectUri : Contains the redirect URI used in OAuth callback. It should not be empty if the field exists in the body. e.g https://example.net/platform
 * 
 * 
 *           * audiences : List of target client IDs who is intended to receive the token. e.g ["eaaa65618fe24293b00a61454182b435", "40073ee9bc3446d3a051a71b48509a5d"]
 * 
 * 
 *           * baseUri : A base URI of the application. It is used in the audience checking for making sure the token is used by the right resource server. Required if the application type is a server. e.g https://example.net/platform
 * 
 * 
 *           * clientPermissions : Contains the client's permissions
 * 
 * 
 *           * deletable : The flag to identify whether client is deletable (optional). e.g. true
 */
@Getter
@Setter
public class AdminUpdateClientV3 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/admin/namespaces/{namespace}/clients/{clientId}";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String clientId;
    private String namespace;
    private ClientmodelClientUpdateV3Request body;

    /**
    * @param clientId required
    * @param namespace required
    * @param body required
    */
    @Builder
    public AdminUpdateClientV3(
            String clientId,
            String namespace,
            ClientmodelClientUpdateV3Request body
    )
    {
        this.clientId = clientId;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public AdminUpdateClientV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.clientId != null){
            pathParams.put("clientId", this.clientId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ClientmodelClientUpdateV3Request getBodyParams(){
        return this.body;
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
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public ClientmodelClientV3Response parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ClientmodelClientV3Response().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}