/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelUserResponseV3;
import net.accelbyte.sdk.api.iam.models.ModelUpgradeHeadlessAccountWithVerificationCodeRequestV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * PublicUpgradeHeadlessAccountV3
 *
 * 
 * 
 * If validateOnly is set false, consume code and upgrade headless account and automatically verified the email address if it is succeeded
 * 
 * 
 * Require valid user access token.
 * 
 * 
 * The endpoint upgrades a headless account by linking the headless account with the email address and the password.
 * By upgrading the headless account into a full account, the user could use the email address and password for using Justice IAM.
 * 
 * 
 * 
 * 
 * The endpoint is a shortcut for upgrading a headless account and verifying the email address in one call.
 * In order to get a verification code for the endpoint, please check the send verification code endpoint.
 * 
 * 
 * 
 * 
 * This endpoint also have an ability to update user data (if the user data field is specified) right after the upgrade account process is done.
 * 
 * Supported user data fields :
 * 
 * 
 *                       * displayName
 * 
 * 
 *                       * dateOfBirth : format YYYY-MM-DD, e.g. 2019-04-29
 * 
 * 
 *                       * country : format ISO3166-1 alpha-2 two letter, e.g. US
 * 
 * 
 * 
 * action code : 10124
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class PublicUpgradeHeadlessAccountV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/public/namespaces/{namespace}/users/me/headless/code/verify";

    @JsonIgnore
    private String method = "POST";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private String namespace;
    private ModelUpgradeHeadlessAccountWithVerificationCodeRequestV3 body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public PublicUpgradeHeadlessAccountV3(
            String namespace,
            ModelUpgradeHeadlessAccountWithVerificationCodeRequestV3 body
    )
    {
        this.namespace = namespace;
        this.body = body;
    }

    @JsonIgnore
    public PublicUpgradeHeadlessAccountV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public ModelUpgradeHeadlessAccountWithVerificationCodeRequestV3 getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ModelUserResponseV3 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelUserResponseV3().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}