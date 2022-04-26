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
import net.accelbyte.sdk.api.basic.models.UserProfilePrivateInfo;
import net.accelbyte.sdk.api.basic.models.UserProfilePrivateUpdate;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updateMyProfile
 *
 * Update my profile.
 * Updates user profile in the target namespace (namespace in the path). If token's namespace doesn't match the target namespace, the service automatically maps the token's user ID into the user ID in the target namespace. The endpoint returns the updated user profile on a successful call.
 * Other detail info:
 * 
 *   * Required permission : resource= "NAMESPACE:{namespace}:PROFILE" , action=4 (UPDATE)
 *   *  Action code : 11402
 *   *  Returns : user profile
 *   *  Path's namespace :
 *     * can be filled with publisher namespace in order to update publisher user profile
 *     * can be filled with game namespace in order to update game user profile
 *   *  Language : allowed format: en, en-US
 *   *  Timezone : IANA time zone, e.g. Asia/Shanghai
 */
@Getter
@Setter
public class UpdateMyProfile extends Operation {
    /**
     * generated field's value
     */
    private String url = "/basic/v1/public/namespaces/{namespace}/users/me/profiles";
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
    private UserProfilePrivateUpdate body;

    /**
    * @param namespace required
    */
    @Builder
    public UpdateMyProfile(
            String namespace,
            UserProfilePrivateUpdate body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateMyProfile createFromJson(String json) throws JsonProcessingException {
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
    public UserProfilePrivateUpdate getBodyParams(){
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
    public UserProfilePrivateInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new UserProfilePrivateInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}