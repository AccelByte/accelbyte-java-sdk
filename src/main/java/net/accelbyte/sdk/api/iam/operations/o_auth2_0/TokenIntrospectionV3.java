/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenIntrospectResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * TokenIntrospectionV3
 *
 * 
 * 
 * This endpoint returns information about an access token intended to be used by resource servers or other internal servers.
 * 
 * 
 * 
 * 
 * This endpoint requires authorized requests header with valid basic or bearer token.
 * 
 * 
 * 
 * 
 * action code : 10705
 */
@Getter
@Setter
public class TokenIntrospectionV3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v3/oauth/introspect";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Basic";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String token;

    /**
    * @param token required
    */
    @Builder
    public TokenIntrospectionV3(
            String token
    )
    {
        this.token = token;
        
        securities.add("Bearer");
        securities.add("Basic");
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

    public OauthmodelTokenIntrospectResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new OauthmodelTokenIntrospectResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}