/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelGetUserJusticePlatformAccountResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * GetUserJusticePlatformAccount
 *
 * 
 * 
 * This endpoint requires the client access token as the bearer token. Required permission 'ADMIN:NAMESPACE:{namespace}:JUSTICE:USER:{userId} [UPDATE]'
 * 
 * 
 * 
 * 
 *  It is going to be removed on November 26th, 2018
 * 
 * 
 * 
 * 
 * The endpoint returns user Justice platform account linked with the given user. If the user Justice platform account doesn't exist in the designated namespace, the endpoint is going toÂ create and return the new Justice platform account.
 * The newly user Justice platform account is going to be forced to perform token grant through the given user and can't perform password update
 * 
 * 
 * 
 * 
 * ### Read Justice Platform Account UserID
 * 
 * 
 * 
 * 
 * In order to read the Justice platform account UserID, it is required to have the permission: NAMESPACE:{namespace}:JUSTICE:USER:{userId} [READ] , otherwise the UserID is going to be censored and replaced with âRedactedâ text.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class GetUserJusticePlatformAccount extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/namespaces/{namespace}/users/{userId}/platforms/justice/{targetNamespace}";
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
    private String targetNamespace;
    private String userId;

    /**
    * @param namespace required
    * @param targetNamespace required
    * @param userId required
    */
    @Builder
    public GetUserJusticePlatformAccount(
            String namespace,
            String targetNamespace,
            String userId
    )
    {
        this.namespace = namespace;
        this.targetNamespace = targetNamespace;
        this.userId = userId;
        
        securities.add("Bearer");
    }

    public GetUserJusticePlatformAccount createFromJson(String json) throws JsonProcessingException {
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
        if (this.targetNamespace != null){
            pathParams.put("targetNamespace", this.targetNamespace);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
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
        if(this.targetNamespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public ModelGetUserJusticePlatformAccountResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelGetUserJusticePlatformAccountResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}