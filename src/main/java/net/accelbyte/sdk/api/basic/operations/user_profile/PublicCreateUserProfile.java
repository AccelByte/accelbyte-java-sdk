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
import net.accelbyte.sdk.api.basic.models.UserProfileInfo;
import net.accelbyte.sdk.api.basic.models.UserProfileCreate;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * publicCreateUserProfile
 *
 * Create user profile.
 * Other detail info:
 * 
 *   * Required permission : resource= "NAMESPACE:{namespace}:USER:{userId}:PROFILE" , action=1 (CREATE)
 *   *  Action code : 11401
 *   *  Language : allowed format: en, en-US
 *   *  Timezone : IANA time zone, e.g. Asia/Shanghai
 *   *  Returns : Created user profile
 */
@Getter
@Setter
public class PublicCreateUserProfile extends Operation {
    /**
     * generated field's value
     */
    private String path = "/basic/v1/public/namespaces/{namespace}/users/{userId}/profiles";
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
    private String userId;
    private UserProfileCreate body;

    /**
    * @param namespace required
    * @param userId required
    */
    @Builder
    public PublicCreateUserProfile(
            String namespace,
            String userId,
            UserProfileCreate body
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.body = body;
        
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
    public UserProfileCreate getBodyParams(){
        return this.body;
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

    public UserProfileInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 201){
            return new UserProfileInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}