/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelUserCreateResponse;
import net.accelbyte.sdk.api.iam.models.ModelUserCreateRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * CreateUser
 *
 * 
 * 
 * Required permission 'NAMESPACE:{namespace}:USER [CREATE]'.
 * 
 * 
 * 
 * 
 * Available Authentication Types:
 * 
 * 
 * 
 * 
 * 
 * 
 *   1.  EMAILPASSWD : an authentication type used for new user registration through email.
 * 
 * 
 *   2.  PHONEPASSWD : an authentication type used for new user registration through phone number.
 * 
 * 
 * 
 * 
 * 
 * Country use ISO3166-1 alpha-2 two letter, e.g. US.
 */
@Getter
@Setter
public class CreateUser extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/namespaces/{namespace}/users";
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
    private ModelUserCreateRequest body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public CreateUser(
            String namespace,
            ModelUserCreateRequest body
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
    public ModelUserCreateRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelUserCreateResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelUserCreateResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}