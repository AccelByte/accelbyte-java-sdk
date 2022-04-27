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
import net.accelbyte.sdk.api.iam.models.OauthcommonJWKSet;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * GetJWKSV3
 *
 * 
 * 
 * This endpoint serves public keys for verifying JWT access tokens generated by this service.
 * 
 * 
 * 
 * 
 * When a client application wants to verify a JWT token, it needs to get the 'kid' value found in the JWT token header and use it
 * to look up the corresponding public key from a set returned by this endpoint. The client application can then use that public key to verify the JWT.
 * 
 * 
 * 
 * 
 * A client application might cache the keys so it doesn't need to do request every time it needs to verify a JWT token. If a client application
 * caches the keys and a key with the same 'kid' cannot be found in the cache, it should then try to refresh the keys by making a request to this
 * endpoint again.
 * 
 * 
 * 
 * 
 * Please refer to the RFC for more information about JWK (JSON Web Key): https://tools.ietf.org/html/rfc7517
 * 
 * 
 * 
 * action code : 10709
 */
@Getter
@Setter
public class GetJWKSV3 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/oauth/jwks";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("");
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
    public GetJWKSV3(
    )
    {
        
        securities.add("Bearer");
    }






    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        return true;
    }

    public OauthcommonJWKSet parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OauthcommonJWKSet().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}