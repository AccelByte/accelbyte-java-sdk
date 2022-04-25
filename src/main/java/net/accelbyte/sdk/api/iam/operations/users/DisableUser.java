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
import net.accelbyte.sdk.api.iam.models.ModelDisableUserRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * DisableUser
 *
 * 
 * 
 * ## The endpoint is going to be deprecated. Please use this instead: iam/v2/admin/namespaces/{namespace}/users/{userId}/disable
 * 
 * 
 * +
 * 
 * Required permissions 'ADMIN:NAMESPACE:{namespace}:USERSTATUS:USER:{userId} [UPDATE]'
 * 
 * 
 * 
 * 
 * For Deletion Account purpose fill the reason with:
 * 
 * 
 * 
 * 
 *     * DeactivateAccount : if your deletion request comes from user
 * 
 * 
 *     * AdminDeactivateAccount : if your deletion request comes from admin
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class DisableUser extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/namespaces/{namespace}/users/{userId}/disable";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String userId;
    private ModelDisableUserRequest body;

    /**
    * @param namespace required
    * @param userId required
    * @param body required
    */
    @Builder
    public DisableUser(
            String namespace,
            String userId,
            ModelDisableUserRequest body
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.body = body;
        
        securities.add("Bearer");
    }

    public DisableUser createFromJson(String json) throws JsonProcessingException {
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
    public ModelDisableUserRequest getBodyParams(){
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
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    @Override
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}