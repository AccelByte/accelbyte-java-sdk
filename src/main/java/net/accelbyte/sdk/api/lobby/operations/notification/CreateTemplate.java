/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.notification;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.models.ModelCreateTemplateRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * createTemplate
 *
 * Required permission : `NAMESPACE:{namespace}:TEMPLATE [CREATE]` with scope `social`
 * 
 * Create new notification template. Include handlebars {{key}} for replaceable contexts. The the key inside
 * handlebars will be the key to be replaced when sending notification. Already existing template with the same
 * slug and language can not be created.
 * 
 * Check model description for detailed input restrictions.
 */
@Getter
@Setter
public class CreateTemplate extends Operation {
    /**
     * generated field's value
     */
    private String path = "/notification/namespaces/{namespace}/templates";
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
    private ModelCreateTemplateRequest body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public CreateTemplate(
            String namespace,
            ModelCreateTemplateRequest body
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
    public ModelCreateTemplateRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
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