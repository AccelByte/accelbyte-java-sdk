/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * RevokeAUser
 *
 * 
 * 
 * ## The endpoint is going to be deprecated at 21 August, 2018. Please use this instead: oauth/namespaces/{namespace}/users/{userId}/revoke
 * 
 * 
 * 
 * 
 * This endpoint revokes a user.
 * 
 * 
 * 
 * 
 * This endpoint requires all requests to have Authorization header set with Bearer access authentication with valid access token.
 * 
 * 
 * 
 * 
 * Required permission 'NAMESPACE:{namespace}:USER:{userID}:ADMIN [UPDATE]'
 * 
 * 
 * 
 * 
 * When other clients know that the userID has been revoked and the token is issued before the revocation, forcing a new token will contain banned permissions.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class RevokeAUser extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/oauth/revoke/user";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String userID;

    /**
    * @param userID required
    */
    @Builder
    public RevokeAUser(
            String userID
    )
    {
        this.userID = userID;
        
        securities.add("Bearer");
    }

    public RevokeAUser createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }





    @Override
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.userID != null) {
            formDataParams.put("userID", this.userID);
        }
        return formDataParams;
    }

    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.userID == null) {
            return false;
        }
        return true;
    }

    @Override
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 200){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}