/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operations.misc;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.models.AddCountryGroupResponse;
import net.accelbyte.sdk.api.basic.models.AddCountryGroupRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * addCountryGroup
 *
 * Add a country groups
 * Country code must follow ISO3166-1 alpha-2.
 * Other detail info:
 * 
 *   * Required permission : resource = "ADMIN:NAMESPACE:{namespace}:MISC" , action=1 (CREATE)
 *   *  Action code : 11201
 *   *  Returns : newly created country group
 */
@Getter
@Setter
public class AddCountryGroup extends Operation {
    /**
     * generated field's value
     */
    private String url = "/basic/v1/admin/namespaces/{namespace}/misc/countrygroups";
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
    private AddCountryGroupRequest body;

    /**
    * @param namespace required
    */
    @Builder
    public AddCountryGroup(
            String namespace,
            AddCountryGroupRequest body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public AddCountryGroup createFromJson(String json) throws JsonProcessingException {
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
    public AddCountryGroupRequest getBodyParams(){
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

    @Override
    public AddCountryGroupResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new AddCountryGroupResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}