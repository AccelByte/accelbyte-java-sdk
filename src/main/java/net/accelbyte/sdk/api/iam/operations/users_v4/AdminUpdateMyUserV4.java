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
import net.accelbyte.sdk.api.iam.models.ModelUserResponseV3;
import net.accelbyte.sdk.api.iam.models.ModelUserUpdateRequestV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminUpdateMyUserV4
 *
 * 
 * 
 * Requires valid user access token
 * 
 * 
 * 
 * 
 * 
 * This Endpoint support update user based on given data. Single request can update single field or multi fields.
 * 
 * 
 * 
 * 
 * Supported field {country, displayName, languageTag, dateOfBirth, userName}
 * 
 * 
 * 
 * 
 * Country use ISO3166-1 alpha-2 two letter, e.g. US.
 * 
 * 
 * 
 * 
 * Date of Birth format : YYYY-MM-DD, e.g. 2019-04-29.
 * 
 * 
 * 
 * 
 * action code : 10103
 */
@Getter
@Setter
public class AdminUpdateMyUserV4 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v4/admin/users/me";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private ModelUserUpdateRequestV3 body;

    /**
    * @param body required
    */
    @Builder
    public AdminUpdateMyUserV4(
            ModelUserUpdateRequestV3 body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
    }

    public AdminUpdateMyUserV4 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }




    @Override
    public ModelUserUpdateRequestV3 getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        return true;
    }

    @Override
    public ModelUserResponseV3 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelUserResponseV3().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}