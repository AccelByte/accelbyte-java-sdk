/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.profanity;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.models.ModelsAdminGetProfanityListFiltersV1Response;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * adminGetProfanityListFiltersV1
 *
 * Required permission : `ADMIN:NAMESPACE:{namespace}:PROFANITY [READ]` with scope `social`
 * 
 * get the list of filters inside the list.
 */
@Getter
@Setter
public class AdminGetProfanityListFiltersV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/lobby/v1/admin/profanity/namespaces/{namespace}/list/{list}/filters";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String list;
    private String namespace;

    /**
    * @param list required
    * @param namespace required
    */
    @Builder
    public AdminGetProfanityListFiltersV1(
            String list,
            String namespace
    )
    {
        this.list = list;
        this.namespace = namespace;
        
        securities.add("Bearer");
    }

    public AdminGetProfanityListFiltersV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.list != null){
            pathParams.put("list", this.list);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }





    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.list == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsAdminGetProfanityListFiltersV1Response parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsAdminGetProfanityListFiltersV1Response().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}