/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.input_validations;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelInputValidationUpdatePayload;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

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
public class AdminUpdateInputValidations extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/admin/inputValidations";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
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
        
        securities.add("Bearer");
    }




    @Override
    public List<ModelInputValidationUpdatePayload> getBodyParams(){
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

    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}