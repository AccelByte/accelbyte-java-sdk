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
import net.accelbyte.sdk.api.iam.models.ModelCountry;
import net.accelbyte.sdk.api.iam.models.ModelCountryAgeRestrictionRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * UpdateCountryAgeRestriction
 *
 * Required permission 'ADMIN:NAMESPACE:{namespace}:AGERESTRICTION [UPDATE]'
 */
@Getter
@Setter
public class UpdateCountryAgeRestriction extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v2/admin/namespaces/{namespace}/countries/{countryCode}";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String countryCode;
    private String namespace;
    private ModelCountryAgeRestrictionRequest body;

    /**
    * @param countryCode required
    * @param namespace required
    * @param body required
    */
    @Builder
    public UpdateCountryAgeRestriction(
            String countryCode,
            String namespace,
            ModelCountryAgeRestrictionRequest body
    )
    {
        this.countryCode = countryCode;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateCountryAgeRestriction createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.countryCode != null){
            pathParams.put("countryCode", this.countryCode);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelCountryAgeRestrictionRequest getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.countryCode == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelCountry parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelCountry().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}