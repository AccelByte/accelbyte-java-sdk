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
import net.accelbyte.sdk.api.iam.models.ModelUserResponseV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminGetUserByPlatformUserIDV3
 *
 * Get User By Platform User ID
 * 
 * This endpoint return user information by given platform ID and platform user ID
 * 
 * nintendo platform user ID : NSA ID need to be appended with Environment ID using colon as separator. e.g kmzwa8awaa:dd1
 */
@Getter
@Setter
public class AdminGetUserByPlatformUserIDV3 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/users/{platformUserId}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String platformId;
    private String platformUserId;

    /**
    * @param namespace required
    * @param platformId required
    * @param platformUserId required
    */
    @Builder
    public AdminGetUserByPlatformUserIDV3(
            String namespace,
            String platformId,
            String platformUserId
    )
    {
        this.namespace = namespace;
        this.platformId = platformId;
        this.platformUserId = platformUserId;
        
        securities.add("Bearer");
    }

    public AdminGetUserByPlatformUserIDV3 createFromJson(String json) throws JsonProcessingException {
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
        if (this.platformId != null){
            pathParams.put("platformId", this.platformId);
        }
        if (this.platformUserId != null){
            pathParams.put("platformUserId", this.platformUserId);
        }
        return pathParams;
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
        if(this.platformId == null) {
            return false;
        }
        if(this.platformUserId == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelUserResponseV3 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelUserResponseV3().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}