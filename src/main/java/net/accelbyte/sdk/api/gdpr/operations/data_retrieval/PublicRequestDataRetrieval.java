/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.operations.data_retrieval;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.models.ModelsDataRetrievalResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * PublicRequestDataRetrieval
 *
 * 
 * 
 * Requires valid user access token
 */
@Getter
@Setter
public class PublicRequestDataRetrieval extends Operation {
    /**
     * generated field's value
     */
    private String path = "/gdpr/public/namespaces/{namespace}/users/{userId}/requests";
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
    public PublicRequestDataRetrieval(
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
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.password != null) {
            formDataParams.put("password", this.password);
        }
        return formDataParams;
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

    public ModelsDataRetrievalResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelsDataRetrievalResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}