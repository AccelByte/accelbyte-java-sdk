/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelUserUpdateRequestV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * UpdateUserV3
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
 * Supported field {country, displayName, languageTag, dateOfBirth}
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
 *  Several case of updating email address
 * 
 *                   * User want to update email address of which have been verified, newEmailAddress response field will be filled with new email address.
 * 
 * 
 *                   * User want to update email address of which have not been verified, { oldEmailAddress, emailAddress} response field will be filled with new email address.
 * 
 * 
 *                   * User want to update email address of which have been verified and updated before, { oldEmailAddress, emailAddress} response field will be filled with verified email before. newEmailAddress response field will be filled with newest email address.
 * 
 * 
 * Important notes:
 * 
 * 
 * 
 * This endpoint provides support for client that doesn't have PATCH support, i.e. UE4 before v4.23 released.
 * 
 * If the client support PATCH method, use [PATCH] /iam/v3/public/namespaces/{namespace}/users/me instead
 * 
 * 
 * 
 * 
 * 
 * action code : 10103
 */
@Getter
@Setter
public class UpdateUserV3 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/public/namespaces/{namespace}/users/me";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private ModelUserUpdateRequestV3 body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public UpdateUserV3(
            String namespace,
            ModelUserUpdateRequestV3 body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateUserV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
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
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public List<ModelUserResponseV3> parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserResponseV3>>() {});
        }
        throw new HttpResponseException(code, json);
    }

}