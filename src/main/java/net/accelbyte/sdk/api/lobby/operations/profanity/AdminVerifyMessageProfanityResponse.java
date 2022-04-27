/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.profanity;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.models.ModelsAdminVerifyMessageProfanityResponse;
import net.accelbyte.sdk.api.lobby.models.ModelsAdminVerifyMessageProfanityRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * adminVerifyMessageProfanityResponse
 *
 * Required permission : `ADMIN:NAMESPACE:{namespace}:PROFANITY [READ]` with scope `social`
 * 
 * verify a message directly from the UI or other services
 */
@Getter
@Setter
public class AdminVerifyMessageProfanityResponse extends Operation {
    /**
     * generated field's value
     */
    private String path = "/lobby/v1/admin/profanity/namespaces/{namespace}/verify";
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
    private ModelsAdminVerifyMessageProfanityRequest body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public AdminVerifyMessageProfanityResponse(
            String namespace,
            ModelsAdminVerifyMessageProfanityRequest body
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
    public ModelsAdminVerifyMessageProfanityRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelsAdminVerifyMessageProfanityResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsAdminVerifyMessageProfanityResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}