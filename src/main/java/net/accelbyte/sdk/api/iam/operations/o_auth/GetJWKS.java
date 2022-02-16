/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.OauthcommonJWKSet;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * GetJWKS
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
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class GetJWKS extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/oauth/jwks";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */

    /**
    */
    public GetJWKS(
    )
    {
    }

    @JsonIgnore
    public GetJWKS createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }





    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }



    @Override
    @JsonIgnore
    public OauthcommonJWKSet parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OauthcommonJWKSet().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}