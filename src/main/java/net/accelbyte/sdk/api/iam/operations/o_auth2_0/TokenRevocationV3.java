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
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * TokenRevocationV3
 *
 * 
 * 
 * This endpoint revokes a token.
 * 
 * 
 * 
 * 
 * This endpoint requires authorized requests header with Basic Authentication from client that establish the token.
 * 
 * 
 * action code: 10706
 */
@Getter
@Setter
public class TokenRevocationV3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v3/oauth/revoke";
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
    public TokenRevocationV3(
            String token
    )
    {
        this.token = token;
        
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

    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}