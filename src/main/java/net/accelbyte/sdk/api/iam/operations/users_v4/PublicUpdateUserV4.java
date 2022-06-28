/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users_v4;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelUserResponseV3;
import net.accelbyte.sdk.api.iam.models.ModelUserUpdateRequestV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * PublicUpdateUserV4
 *
 * 
 * 
 * Requires valid user access token
 * 
 * 
 * 
 * 
 * 
 * This Endpoint support update user based on given data. Single request can update single field or multi fields.
 * 
 * 
 * 
 * 
 * Supported field {country, displayName, languageTag, dateOfBirth}
 * 
 * 
 * 
 * 
 * Country use ISO3166-1 alpha-2 two letter, e.g. US.
 * 
 * 
 * 
 * 
 * Date of Birth format : YYYY-MM-DD, e.g. 2019-04-29.
 * 
 * 
 * 
 *  Several case of updating email address
 * 
 * 
 * action code : 10103
 */
@Getter
@Setter
public class PublicUpdateUserV4 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v4/public/namespaces/{namespace}/users/me";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private ModelUserUpdateRequestV3 body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public PublicUpdateUserV4(
            String namespace,
            ModelUserUpdateRequestV3 body
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
    public ModelUserUpdateRequestV3 getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelUserResponseV3 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelUserResponseV3().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}