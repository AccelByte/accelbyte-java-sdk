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
import net.accelbyte.sdk.api.iam.models.AccountCreateUserResponseV4;
import net.accelbyte.sdk.api.iam.models.AccountCreateTestUserRequestV4;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * PublicCreateTestUserV4
 *
 * Create a test user and not send verification code email
 * 
 * 
 * 
 * Required attributes:
 * - verified: this new user is verified or not
 * - authType: possible value is EMAILPASSWD
 * - emailAddress: 5 to 254 characters
 * - username: 3 to 48 characters, case insensitive, alphanumeric with allowed symbols underscore (_) and dot (.)
 * - password: 8 to 32 characters, satisfy at least 3 out of 4 conditions(uppercase, lowercase letters, numbers and special characters) and should not have more than 2 equal characters in a row.
 * - country: ISO3166-1 alpha-2 two letter, e.g. US.
 * - dateOfBirth: YYYY-MM-DD, e.g. 1990-01-01. valid values are between 1905-01-01 until current date.
 * 
 * 
 * Not required attributes:
 * - displayName: 1 to 48 characters
 * 
 * 
 * 
 * 
 * 
 * This endpoint support accepting agreements for the created user. Supply the accepted agreements in acceptedPolicies attribute.
 */
@Getter
@Setter
public class PublicCreateTestUserV4 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v4/public/namespaces/{namespace}/test_users";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private AccountCreateTestUserRequestV4 body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public PublicCreateTestUserV4(
            String namespace,
            AccountCreateTestUserRequestV4 body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
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
    public AccountCreateTestUserRequestV4 getBodyParams(){
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

    public AccountCreateUserResponseV4 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new AccountCreateUserResponseV4().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}