/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.operations.data_deletion;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.models.ModelsRequestDeleteResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * PublicSubmitUserAccountDeletionRequest
 *
 * 
 * 
 * Requires valid user access token and password
 */
@Getter
@Setter
public class PublicSubmitUserAccountDeletionRequest extends Operation {
    /**
     * generated field's value
     */
    private String url = "/gdpr/public/namespaces/{namespace}/users/{userId}/deletions";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String userId;
    private String password;

    /**
    * @param namespace required
    * @param userId required
    * @param password required
    */
    @Builder
    public PublicSubmitUserAccountDeletionRequest(
            String namespace,
            String userId,
            String password
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.password = password;
        
        securities.add("Bearer");
    }

    public PublicSubmitUserAccountDeletionRequest createFromJson(String json) throws JsonProcessingException {
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
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }




    @Override
    public Map<String, Object> getFormDataParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.password != null) {
            formDataParams.put("password", this.password);
        }
        return formDataParams;
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
        if(this.userId == null) {
            return false;
        }
        if(this.password == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsRequestDeleteResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelsRequestDeleteResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}