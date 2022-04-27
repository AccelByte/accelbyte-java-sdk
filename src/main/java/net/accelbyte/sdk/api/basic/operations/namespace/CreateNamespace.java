/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operations.namespace;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.models.NamespaceInfo;
import net.accelbyte.sdk.api.basic.models.NamespaceCreate;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * createNamespace
 *
 * Create a namespace.
 * By default the namespace is enabled.
 * Other detail info:
 * 
 *   * Required permission : resource= "ADMIN:NAMESPACE" , action=1 (CREATE)
 *   *  Action code : 11301
 *   *  Returns : created namespace
 */
@Getter
@Setter
public class CreateNamespace extends Operation {
    /**
     * generated field's value
     */
    private String path = "/basic/v1/admin/namespaces";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private NamespaceCreate body;

    /**
    */
    @Builder
    public CreateNamespace(
            NamespaceCreate body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
    }




    @Override
    public NamespaceCreate getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        return true;
    }

    public NamespaceInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 201){
            return new NamespaceInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}