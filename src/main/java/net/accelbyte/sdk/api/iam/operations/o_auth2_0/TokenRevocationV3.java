/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class TokenRevocationV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/oauth/revoke";

    @JsonIgnore
    private String method = "POST";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
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
    }

    @JsonIgnore
    public TokenRevocationV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }




    @Override
    @JsonIgnore
    public Map<String, Object> getFormDataParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.token != null) {
            formDataParams.put("token", this.token);
        }
        return formDataParams;
    }

    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("token","token");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "token"        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.token == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 200){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}