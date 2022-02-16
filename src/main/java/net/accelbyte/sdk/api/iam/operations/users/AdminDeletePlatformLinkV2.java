/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * AdminDeletePlatformLinkV2
 *
 * 
 * 
 * Required permission 'ADMIN:NAMESPACE:{namespace}:USER:{userId} [DELETE]'.
 * 
 * 
 * 
 * 
 * ## Supported platforms:
 * 
 * 
 * 
 * 
 *           * steam
 * 
 * 
 *           * steamopenid
 * 
 * 
 *           * facebook
 * 
 * 
 *           * google
 * 
 * 
 *           * oculus
 * 
 * 
 *           * twitch
 * 
 * 
 *           * android
 * 
 * 
 *           * ios
 * 
 * 
 *           * device
 * 
 * 
 *           * discord
 * 
 * 
 * 
 * 
 * Delete link of user's account with platform. 'justice' platform might have multiple accounts from different namespaces linked. platform_namespace need to be specified when the platform ID is 'justice'.
 * 
 * Delete link of justice platform will enable password token grant and password update.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminDeletePlatformLinkV2 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v2/admin/namespaces/{namespace}/users/{userId}/platforms/{platformId}/link";

    @JsonIgnore
    private String method = "DELETE";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded","text/plain");

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
    private String platformNamespace;

    /**
    * @param namespace required
    * @param platformId required
    * @param userId required
    */
    public AdminDeletePlatformLinkV2(
            String namespace,
            String platformId,
            String userId,
            String platformNamespace
    )
    {
        this.namespace = namespace;
        this.platformId = platformId;
        this.userId = userId;
        this.platformNamespace = platformNamespace;
    }

    @JsonIgnore
    public AdminDeletePlatformLinkV2 createFromJson(String json) throws JsonProcessingException {
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
        if (this.platformNamespace != null) {
            formDataParams.put("platform_namespace", this.platformNamespace);
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
        result.put("platform_namespace","platformNamespace");
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
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}