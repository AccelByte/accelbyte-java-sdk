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
import net.accelbyte.sdk.api.iam.models.ClientmodelClientCreationResponse;
import net.accelbyte.sdk.api.iam.models.ClientmodelClientCreateRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * CreateClient
 *
 * 
 * 
 * ## The endpoint is going to be deprecated at 16 August, 2018. Please use this instead: namespaces/{namespace}/clients
 * 
 * 
 * 
 * 
 * Required permission 'CLIENT:ADMIN [CREATE]'
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class CreateClient extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/clients";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private ClientmodelClientCreateRequest body;

    /**
    * @param body required
    */
    @Builder
    public CreateClient(
            ClientmodelClientCreateRequest body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
    }




    @Override
    public ClientmodelClientCreateRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        return true;
    }

    public ClientmodelClientCreationResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 201){
            return new ClientmodelClientCreationResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}