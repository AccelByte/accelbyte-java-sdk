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
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenThirdPartyResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * RetrieveUserThirdPartyPlatformTokenV3
 *
 * Retrieve User Third Party Platform Token
 * 
 * 
 * 
 * 
 * This endpoint used for retrieving third party platform token for user that login using third party.
 * Passing platform group name or it's member will return same access token that can be used across the platform members.
 * 
 * 
 * 
 * 
 * 
 * The third party platform and platform group covered for this is:
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
 *                 * epicgames
 * 
 * 
 *                 * twitch
 * 
 * 
 *                 * awscognito
 */
@Getter
@Setter
public class RetrieveUserThirdPartyPlatformTokenV3 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/oauth/namespaces/{namespace}/users/{userId}/platforms/{platformId}/platformToken";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String platformId;
    private String userId;

    /**
    * @param namespace required
    * @param platformId required
    * @param userId required
    */
    @Builder
    public RetrieveUserThirdPartyPlatformTokenV3(
            String namespace,
            String platformId,
            String userId
    )
    {
        this.namespace = namespace;
        this.platformId = platformId;
        this.userId = userId;
        
        securities.add("Bearer");
    }

    public RetrieveUserThirdPartyPlatformTokenV3 createFromJson(String json) throws JsonProcessingException {
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
        if (this.platformId != null){
            pathParams.put("platformId", this.platformId);
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
        if(this.platformId == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public OauthmodelTokenThirdPartyResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OauthmodelTokenThirdPartyResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}