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
import net.accelbyte.sdk.api.lobby.models.ModelUpdateTopicRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * updateTopicByTopicName
 *
 * Required permission : `NAMESPACE:{namespace}:TOPIC [UPDATE]` with scope `social`
 * 
 * update topic information by topic name.
 * 
 * topic should be alphabets, no special char except underscore, uppercase and no spacing. for example: TOPIC_TEST.
 * Already existing topic can not be created
 */
@Getter
@Setter
public class UpdateTopicByTopicName extends Operation {
    /**
     * generated field's value
     */
    private String path = "/notification/namespaces/{namespace}/topics/{topic}";
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
    private String topic;
    private ModelUpdateTopicRequest body;

    /**
    * @param namespace required
    * @param topic required
    * @param body required
    */
    @Builder
    public UpdateTopicByTopicName(
            String namespace,
            String topic,
            ModelUpdateTopicRequest body
    )
    {
        this.namespace = namespace;
        this.topic = topic;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.topic != null){
            pathParams.put("topic", this.topic);
        }
        return pathParams;
    }



    @Override
    public ModelUpdateTopicRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.topic == null) {
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