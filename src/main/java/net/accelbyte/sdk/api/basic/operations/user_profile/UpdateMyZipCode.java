/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operations.user_profile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.models.UserZipCode;
import net.accelbyte.sdk.api.basic.models.UserZipCodeUpdate;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updateMyZipCode
 *
 * Update my zip code.
 * Other detail info:
 * 
 *   * Required permission : resource= "NAMESPACE:{namespace}:PROFILE" , action=4 (UPDATE)
 *   *  Action code : 11408
 *   *  Returns : user zip code
 */
@Getter
@Setter
public class UpdateMyZipCode extends Operation {
    /**
     * generated field's value
     */
    private String url = "/basic/v1/public/namespaces/{namespace}/users/me/profiles/zipCode";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private UserZipCodeUpdate userZipCodeUpdate;

    /**
    * @param namespace required
    * @param userZipCodeUpdate required
    */
    @Builder
    public UpdateMyZipCode(
            String namespace,
            UserZipCodeUpdate userZipCodeUpdate
    )
    {
        this.namespace = namespace;
        this.userZipCodeUpdate = userZipCodeUpdate;
        
        securities.add("Bearer");
    }

    public UpdateMyZipCode createFromJson(String json) throws JsonProcessingException {
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
    public UserZipCodeUpdate getBodyParams(){
        return this.userZipCodeUpdate;
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

    @Override
    public UserZipCode parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new UserZipCode().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}