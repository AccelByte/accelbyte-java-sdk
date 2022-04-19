/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.input_validations;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelInputValidationUpdatePayload;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminUpdateInputValidations
 *
 * 
 * 
 * Required permission 'ADMIN:CONFIGURATION' [UPDATE]
 * 
 * 
 * 
 * 
 * This endpoint is used to update input validation configuration.
 * 
 * 
 * Supported `field`:
 * 
 * 
 * 
 *           * displayName
 * 
 * 
 *           * password
 * 
 * 
 *           * username
 * 
 * 
 * 
 * 
 * If `isCustomRegex` is set to true, `regex` parameter will be used as input validation and the other parameters will be ignored. Otherwise, `regex` parameter will be ignored and regex for input validation will be generated based on the combination of the other parameters.
 * 
 * 
 * 
 * 
 * If `allowUnicode` is set to true, unicode regex pattern will be use as the input validation and the other parameters will be ignored.
 * 
 * 
 * Supported `letterCase`:
 * 
 * 
 * 
 *           * lowercase
 * 
 * 
 *           * uppercase
 * 
 * 
 *           * mixed: uppercase and lowercase
 * 
 * 
 *           * mixed: uppercase and/or lowercase
 * 
 * 
 * Supported `specialCharacterLocation`:
 * 
 * 
 * 
 *           * anywhere
 * 
 * 
 *           * middle
 * 
 * 
 * 
 * 
 * If `specialCharacters` is empty, `specialCharacterLocation` and `maxRepeatingSpecialCharacter` will be ignored.
 * 
 * 
 * 
 * 
 * `minCharType` is used to identify how many required criteria in the regex. The supported criteria are number, letter, special character, and letter case. If set to 0 or 1 means all criteria are optional. It can be set as much as the number of criteria enabled.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminUpdateInputValidations extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/admin/inputValidations";

    @JsonIgnore
    private String method = "PUT";

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
    private List<ModelInputValidationUpdatePayload> body;

    /**
    * @param body required
    */
    @Builder
    public AdminUpdateInputValidations(
            List<ModelInputValidationUpdatePayload> body
    )
    {
        this.body = body;
    }

    @JsonIgnore
    public AdminUpdateInputValidations createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }



    @Override
    @JsonIgnore
    public List<ModelInputValidationUpdatePayload> getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }


    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        return true;
    }

    @Override
    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}