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
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * adminImportProfanityFiltersFromFile
 *
 * Required permission : `ADMIN:NAMESPACE:{namespace}:PROFANITY [CREATE]` with scope `social`
 * 
 * import a file with filters
 */
@Getter
@Setter
public class AdminImportProfanityFiltersFromFile extends Operation {
    /**
     * generated field's value
     */
    private String url = "/lobby/v1/admin/profanity/namespaces/{namespace}/list/{list}/filters/bulk-file";
    private String method = "POST";
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
    private List<Integer> body;

    /**
    * @param list required
    * @param namespace required
    * @param body required
    */
    @Builder
    public AdminImportProfanityFiltersFromFile(
            String list,
            String namespace,
            List<Integer> body
    )
    {
        this.list = list;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public AdminImportProfanityFiltersFromFile createFromJson(String json) throws JsonProcessingException {
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
    public List<Integer> getBodyParams(){
        return this.body;
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

    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            String json = this.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}