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
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Change2FAMethod
 *
 * Change 2FA method
 * 
 * 
 * 
 * This endpoint is used for change 2FA method. Only enabled methods are accepted.
 * 
 * 
 * 
 * 
 * Supported methods:
 * 
 * 
 * 
 * 
 *                 * authenticator
 * 
 * 
 *                 * backupCodes
 */
@Getter
@Setter
public class Change2faMethod extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/oauth/mfa/factor/change";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String factor;
    private String mfaToken;

    /**
    * @param factor required
    * @param mfaToken required
    */
    @Builder
    public Change2faMethod(
            String factor,
            String mfaToken
    )
    {
        this.factor = factor;
        this.mfaToken = mfaToken;
        
        securities.add("Bearer");
    }

    public Change2faMethod createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }





    @Override
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.factor != null) {
            formDataParams.put("factor", this.factor);
        }
        if (this.mfaToken != null) {
            formDataParams.put("mfaToken", this.mfaToken);
        }
        return formDataParams;
    }

    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.factor == null) {
            return false;
        }
        if(this.mfaToken == null) {
            return false;
        }
        return true;
    }

    @Override
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}