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
import net.accelbyte.sdk.api.lobby.models.ModelUpdateTopicRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updateNotificationTopicV1Admin
 *
 * Required permission : `ADMIN:NAMESPACE:{namespace}:NOTIFICATION [UPDATE]` with scope `social`
 * 
 * update topic information by topic name.
 * 
 * topic should be alphabets, no special char except underscore, uppercase and no spacing. for example: TOPIC_TEST.
 * Already existing topic can not be created
 * 
 * Action Code: 50216
 */
@Getter
@Setter
public class UpdateNotificationTopicV1Admin extends Operation {
    /**
     * generated field's value
     */
    private String url = "/lobby/v1/admin/notification/namespaces/{namespace}/topics/{topicName}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String topicName;
    private ModelUpdateTopicRequest body;

    /**
    * @param namespace required
    * @param topicName required
    * @param body required
    */
    @Builder
    public UpdateNotificationTopicV1Admin(
            String namespace,
            String topicName,
            ModelUpdateTopicRequest body
    )
    {
        this.namespace = namespace;
        this.topicName = topicName;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateNotificationTopicV1Admin createFromJson(String json) throws JsonProcessingException {
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
        if (this.topicName != null){
            pathParams.put("topicName", this.topicName);
        }
        return pathParams;
    }



    @Override
    public ModelUpdateTopicRequest getBodyParams(){
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
        if(this.topicName == null) {
            return false;
        }
        return true;
    }

    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}