/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operations.user_profile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.models.UserProfilePrivateInfo;
import net.accelbyte.sdk.api.basic.models.UserProfilePrivateCreate;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * createMyProfile
 *
 * Create my profile.
 *  Client with user token can create user profile in target namespace
 * Other detail info:
 * 
 *   * Required permission : resource= "NAMESPACE:{namespace}:PROFILE" , action=1 (CREATE)
 *   *  Action code : 11401
 *   *  Returns : Created user profile
 *   *  Path's namespace :
 *     * can be filled with publisher namespace in order to create publisher user profile
 *     * can be filled with game namespace in order to create game user profile
 *   *  Language : allowed format: en, en-US
 *   *  Country : ISO3166-1 alpha-2 two letter, e.g. US
 *   * Timezone : IANA time zone, e.g. Asia/Shanghai
 */
@Getter
@Setter
public class CreateMyProfile extends Operation {
    /**
     * generated field's value
     */
    private String path = "/basic/v1/public/namespaces/{namespace}/users/me/profiles";
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
    private UserProfilePrivateCreate body;

    /**
    * @param namespace required
    */
    @Builder
    public CreateMyProfile(
            String namespace,
            UserProfilePrivateCreate body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
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
    public UserProfilePrivateCreate getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public UserProfilePrivateInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 201){
            return new UserProfilePrivateInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}