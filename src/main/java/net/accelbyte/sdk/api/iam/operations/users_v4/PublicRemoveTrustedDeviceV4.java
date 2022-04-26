/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users_v4;

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
 * PublicRemoveTrustedDeviceV4
 *
 * 
 * 
 * (Only for test)This endpoint is used to remove trusted device.
 * 
 * 
 * 
 * 
 * This endpoint Requires valid user access token
 * 
 * 
 * 
 * 
 * 
 * This endpoint Requires device_token in cookie
 */
@Getter
@Setter
public class PublicRemoveTrustedDeviceV4 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v4/public/namespaces/{namespace}/users/me/mfa/device";
    private String method = "DELETE";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String deviceToken;

    /**
    * @param namespace required
    * @param deviceToken required
    */
    @Builder
    public PublicRemoveTrustedDeviceV4(
            String namespace,
            String deviceToken
    )
    {
        this.namespace = namespace;
        this.deviceToken = deviceToken;
        
        securities.add("Bearer");
    }

    public PublicRemoveTrustedDeviceV4 createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, String> getCookieParams(){
        Map<String, String> cookieParams = new HashMap<>();
        if (this.deviceToken != null){
            cookieParams.put("device_token", this.deviceToken);
        }
        return cookieParams;
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
        if(this.deviceToken == null) {
            return false;
        }
        return true;
    }

    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}