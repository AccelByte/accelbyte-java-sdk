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
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponseV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Verify2FACode
 *
 * Verify 2FA code
 * 
 * 
 * 
 * This endpoint is used for verifying 2FA code.
 */
@Getter
@Setter
public class Verify2faCode extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/oauth/mfa/verify";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String code;
    private String factor;
    private String mfaToken;
    private Boolean rememberDevice;

    /**
    * @param code required
    * @param factor required
    * @param mfaToken required
    * @param rememberDevice required
    */
    @Builder
    public Verify2faCode(
            String code,
            String factor,
            String mfaToken,
            Boolean rememberDevice
    )
    {
        this.code = code;
        this.factor = factor;
        this.mfaToken = mfaToken;
        this.rememberDevice = rememberDevice;
        
        securities.add("Bearer");
    }

    public Verify2faCode createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }





    @Override
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.code != null) {
            formDataParams.put("code", this.code);
        }
        if (this.factor != null) {
            formDataParams.put("factor", this.factor);
        }
        if (this.mfaToken != null) {
            formDataParams.put("mfaToken", this.mfaToken);
        }
        if (this.rememberDevice != null) {
            formDataParams.put("rememberDevice", this.rememberDevice == null ? null : String.valueOf(this.rememberDevice));
        }
        return formDataParams;
    }

    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.code == null) {
            return false;
        }
        if(this.factor == null) {
            return false;
        }
        if(this.mfaToken == null) {
            return false;
        }
        if(this.rememberDevice == null) {
            return false;
        }
        return true;
    }

    @Override
    public OauthmodelTokenResponseV3 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OauthmodelTokenResponseV3().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}