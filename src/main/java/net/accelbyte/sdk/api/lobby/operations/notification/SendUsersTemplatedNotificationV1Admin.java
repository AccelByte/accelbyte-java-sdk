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
import net.accelbyte.sdk.api.lobby.models.ModelNotificationWithTemplateRequestV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * sendUsersTemplatedNotificationV1Admin
 *
 * Required permission : `ADMIN:NAMESPACE:{namespace}:NOTIFICATION [CREATE]` with scope `social`
 * 
 * Sends notification to all connected users in a namespace with predefined template.
 * 
 * In the request body, specify which template slug (template identifier) to use and the template language.
 * 
 * NotificationTemplate context is the key-value pair defining the value of each handlebar specified in the template content.
 * Template need to be published before it can be use to send notifications
 * 
 * Action Code: 50202
 */
@Getter
@Setter
public class SendUsersTemplatedNotificationV1Admin extends Operation {
    /**
     * generated field's value
     */
    private String url = "/lobby/v1/admin/notification/namespaces/{namespace}/templates/notify";
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
    private ModelNotificationWithTemplateRequestV1 body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public SendUsersTemplatedNotificationV1Admin(
            String namespace,
            ModelNotificationWithTemplateRequestV1 body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public SendUsersTemplatedNotificationV1Admin createFromJson(String json) throws JsonProcessingException {
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
    public ModelNotificationWithTemplateRequestV1 getBodyParams(){
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

    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 202){
            String json = this.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}