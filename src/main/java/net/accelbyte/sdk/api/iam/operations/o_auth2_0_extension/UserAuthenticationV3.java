/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension;

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
 * UserAuthenticationV3
 *
 * 
 * 
 * This endpoint is being used to authenticate a user account.
 * It validates user's email / username and password. Deactivated or login-banned users are unable to login
 * Redirect URI and Client ID must be specified as a pair and only used to redirect to the specified
 * redirect URI in case the requestId is no longer valid.
 * 
 * 
 * 
 * action code: 10801
 */
@Getter
@Setter
public class UserAuthenticationV3 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/authenticate";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Basic";
    private String locationQuery = "code";
    /**
     * fields as input parameter
     */
    private String clientId;
    private Boolean extendExp;
    private String redirectUri;
    private String password;
    private String requestId;
    private String userName;

    /**
    * @param password required
    * @param requestId required
    * @param userName required
    */
    @Builder
    public UserAuthenticationV3(
            String clientId,
            Boolean extendExp,
            String redirectUri,
            String password,
            String requestId,
            String userName
    )
    {
        this.clientId = clientId;
        this.extendExp = extendExp;
        this.redirectUri = redirectUri;
        this.password = password;
        this.requestId = requestId;
        this.userName = userName;
        
        securities.add("Basic");
    }

    public UserAuthenticationV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }





    @Override
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.clientId != null) {
            formDataParams.put("client_id", this.clientId);
        }
        if (this.extendExp != null) {
            formDataParams.put("extend_exp", this.extendExp == null ? null : String.valueOf(this.extendExp));
        }
        if (this.redirectUri != null) {
            formDataParams.put("redirect_uri", this.redirectUri);
        }
        if (this.password != null) {
            formDataParams.put("password", this.password);
        }
        if (this.requestId != null) {
            formDataParams.put("request_id", this.requestId);
        }
        if (this.userName != null) {
            formDataParams.put("user_name", this.userName);
        }
        return formDataParams;
    }

    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.password == null) {
            return false;
        }
        if(this.requestId == null) {
            return false;
        }
        if(this.userName == null) {
            return false;
        }
        return true;
    }

    @Override
    public String parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code != 302){
            throw new HttpResponseException(code, json);
        }
        return json;
    }

}