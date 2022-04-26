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
import net.accelbyte.sdk.api.iam.models.ModelAuthenticatorKeyResponseV4;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminGenerateMyAuthenticatorKeyV4
 *
 * 
 * 
 * This endpoint is used to generate a secret key for 3rd-party authenticator app.
 * A QR code URI is also returned so that frontend can generate QR code image.
 * 
 * 
 * 
 * 
 * This endpoint Requires valid user access token
 */
@Getter
@Setter
public class AdminGenerateMyAuthenticatorKeyV4 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v4/admin/users/me/mfa/authenticator/key";
    private String method = "POST";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */

    /**
    */
    @Builder
    public AdminGenerateMyAuthenticatorKeyV4(
    )
    {
        
        securities.add("Bearer");
    }

    public AdminGenerateMyAuthenticatorKeyV4 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }






    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }


    @Override
    public ModelAuthenticatorKeyResponseV4 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelAuthenticatorKeyResponseV4().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}