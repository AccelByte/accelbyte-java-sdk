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
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenThirdPartyResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminRetrieveUserThirdPartyPlatformTokenV3
 *
 * Admin Retrieve User Third Party Platform Token
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
 * Notes:
 * 
 * 
 * 
 * 
 *                 * Required permission: ADMIN:NAMESPACE:{namespace}:USER:{userId} [READ]
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
 *                 * xbox live
 * 
 * 
 *                 * steam
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminRetrieveUserThirdPartyPlatformTokenV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/oauth/admin/namespaces/{namespace}/users/{userId}/platforms/{platformId}/platformToken";

    @JsonIgnore
    private String method = "GET";

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

    /**
    * @param namespace required
    * @param platformId required
    * @param userId required
    */
    public AdminRetrieveUserThirdPartyPlatformTokenV3(
            String namespace,
            String platformId,
            String userId
    )
    {
        this.namespace = namespace;
        this.platformId = platformId;
        this.userId = userId;
    }

    @JsonIgnore
    public AdminRetrieveUserThirdPartyPlatformTokenV3 createFromJson(String json) throws JsonProcessingException {
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
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("platformId","platformId");
        result.put("userId","userId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "platformId",
            "userId"
        );
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
        return true;
    }

    @Override
    @JsonIgnore
    public OauthmodelTokenThirdPartyResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OauthmodelTokenThirdPartyResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}