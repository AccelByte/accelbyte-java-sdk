/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.clients;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ClientmodelClientUpdateSecretRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * UpdateClientSecret
 *
 * Required permission 'CLIENT:ADMIN [UPDATE]'
 */
@Getter
@Setter
public class UpdateClientSecret extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/clients/{clientId}/secret";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String clientId;
    private ClientmodelClientUpdateSecretRequest body;

    /**
    * @param clientId required
    * @param body required
    */
    @Builder
    public UpdateClientSecret(
            String clientId,
            ClientmodelClientUpdateSecretRequest body
    )
    {
        this.clientId = clientId;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.clientId != null){
            pathParams.put("clientId", this.clientId);
        }
        return pathParams;
    }



    @Override
    public ClientmodelClientUpdateSecretRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.clientId == null) {
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