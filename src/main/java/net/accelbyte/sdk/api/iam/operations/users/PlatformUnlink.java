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
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * PlatformUnlink
 *
 * 
 * 
 * Required permission 'NAMESPACE:{namespace}:USER:{userId} [UPDATE]'.
 * 
 * 
 * 
 * 
 * ## Supported platforms:
 * 
 * 
 * 
 * 
 *         * steam
 * 
 * 
 *         * steamopenid
 * 
 * 
 *         * facebook
 * 
 * 
 *         * google
 * 
 * 
 *         * oculus
 * 
 * 
 *         * twitch
 * 
 * 
 *         * android
 * 
 * 
 *         * ios
 * 
 * 
 *         * device
 * 
 * 
 *         * justice : A user might have several 'justiceâ platform on different namespaces. Thatâs why the platform_namespace need to be specified when the platform ID is âjusticeâ. The platform_namespace is the designated userâs namespace.
 * 
 * 
 * 
 * 
 * Unlink user's account with platform. 'justice' platform might have multiple accounts from different namespaces linked. platform_namespace need to be specified when the platform ID is 'justice'.
 * 
 * Unlinking justice platform will enable password token grant and password update.
 */
@Getter
@Setter
public class PlatformUnlink extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/namespaces/{namespace}/users/{userId}/platforms/{platformId}/unlink";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded","text/plain");
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
    private String platformNamespace;

    /**
    * @param namespace required
    * @param platformId required
    * @param userId required
    */
    @Builder
    public PlatformUnlink(
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
        
        securities.add("Bearer");
    }

    public PlatformUnlink createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.platformNamespace != null) {
            formDataParams.put("platform_namespace", this.platformNamespace);
        }
        return formDataParams;
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

    @Override
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}