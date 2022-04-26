/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.notification;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.models.ModelFreeFormNotificationRequestV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * sendUsersFreeformNotificationV1Admin
 *
 * Required permission : `ADMIN:NAMESPACE:{namespace}:NOTIFICATION [CREATE]` with scope `social`
 * 
 * Sends notification to all connected users in a namespace.
 * 
 * Action Code: 50201
 */
@Getter
@Setter
public class SendUsersFreeformNotificationV1Admin extends Operation {
    /**
     * generated field's value
     */
    private String url = "/lobby/v1/admin/notification/namespaces/{namespace}/freeform/notify";
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
    private ModelFreeFormNotificationRequestV1 body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public SendUsersFreeformNotificationV1Admin(
            String namespace,
            ModelFreeFormNotificationRequestV1 body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public SendUsersFreeformNotificationV1Admin createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
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
    public ModelFreeFormNotificationRequestV1 getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 202){
            String json = this.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}