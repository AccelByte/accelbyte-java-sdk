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
import net.accelbyte.sdk.api.iam.models.ModelInputValidationsPublicResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * PublicGetInputValidations
 *
 * 
 * 
 * No role required
 * 
 * 
 * 
 * 
 * This endpoint is to get list of input validation configuration.
 * 
 * 
 * 
 * 
 * `regex` parameter will be returned if `isCustomRegex` is true. Otherwise, it will be empty.
 */
@Getter
@Setter
public class PublicGetInputValidations extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/public/inputValidations";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private Boolean defaultOnEmpty;
    private String languageCode;

    /**
    */
    @Builder
    public PublicGetInputValidations(
            Boolean defaultOnEmpty,
            String languageCode
    )
    {
        this.defaultOnEmpty = defaultOnEmpty;
        this.languageCode = languageCode;
        
        securities.add("Bearer");
    }

    public PublicGetInputValidations createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }


    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("defaultOnEmpty", this.defaultOnEmpty == null ? null : Arrays.asList(String.valueOf(this.defaultOnEmpty)));
        queryParams.put("languageCode", this.languageCode == null ? null : Arrays.asList(this.languageCode));
        return queryParams;
    }




    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }


    public ModelInputValidationsPublicResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelInputValidationsPublicResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("defaultOnEmpty", "None");
        result.put("languageCode", "None");
        return result;
    }
}