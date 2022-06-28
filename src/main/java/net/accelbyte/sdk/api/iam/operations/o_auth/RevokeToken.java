/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * RevokeToken
 *
 * 
 * 
 * # Deprecated at August 30, 2019. Please use the /v3/oauth/revoke endpoint instead
 * 
 * 
 * 
 * 
 * Revokes a token.
 * 
 * 
 * 
 * 
 * This endpoint requires all requests to have Authorization header set with Basic access authentication constructed from client id and client secret or Bearer access authentication with valid access token.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class RevokeToken extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/oauth/revoke/token";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String token;

    /**
    * @param token required
    */
    @Builder
    public RevokeToken(
            String token
    )
    {
        this.token = token;
        
        securities.add("Bearer");
    }





    @Override
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.token != null) {
            formDataParams.put("token", this.token);
        }
        return formDataParams;
    }

    @Override
    public boolean isValid() {
        if(this.token == null) {
            return false;
        }
        return true;
    }

    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}