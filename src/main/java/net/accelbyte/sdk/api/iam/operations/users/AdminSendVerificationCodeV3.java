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
import net.accelbyte.sdk.api.iam.models.ModelSendVerificationCodeRequestV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * AdminSendVerificationCodeV3
 *
 * Required permission 'ADMIN:NAMESPACE:{namespace}:USER:{userId} [UPDATE]'
 * 
 * 
 * The verification code is sent to email address.
 * 
 * 
 * 
 * 
 * Available contexts for use :
 * 
 * 
 * 
 * 
 *             1. UserAccountRegistration
 * 
 * 
 * a context type used for verifying email address in user account registration. It returns 409 if the email address already verified.
 * It is the default context if the Context field is empty
 * 
 * 
 * 
 * 
 * 
 *             2. UpdateEmailAddress
 * 
 * 
 * a context type used for verify user before updating email address.(Without email address verified checking)
 * 
 * 
 * 
 * 
 * 
 *             3. upgradeHeadlessAccount
 * 
 * 
 * The context is intended to be used whenever the email address wanted to be automatically verified on upgrading a headless account.
 * If this context used, IAM rejects the request if the email address is already used by others by returning HTTP Status Code 409.
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * action code: 10116
 */
@Getter
@Setter
public class AdminSendVerificationCodeV3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v3/admin/namespaces/{namespace}/users/{userId}/code/request";
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
    private ModelSendVerificationCodeRequestV3 body;

    /**
    * @param namespace required
    * @param userId required
    * @param body required
    */
    @Builder
    public AdminSendVerificationCodeV3(
            String namespace,
            String userId,
            ModelSendVerificationCodeRequestV3 body
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
    public ModelSendVerificationCodeRequestV3 getBodyParams(){
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

    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 204){
            String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}