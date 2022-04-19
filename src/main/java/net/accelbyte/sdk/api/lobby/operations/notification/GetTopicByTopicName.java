/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.notification;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.models.ModelNotificationTopicResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * getTopicByTopicName
 *
 * Required permission : `NAMESPACE:{namespace}:TOPIC [READ]` with scope `social`
 * 
 * get topic information by topic name.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class GetTopicByTopicName extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/notification/namespaces/{namespace}/topics/{topic}";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private String namespace;
    private String topic;

    /**
    * @param namespace required
    * @param topic required
    */
    @Builder
    public GetTopicByTopicName(
            String namespace,
            String topic
    )
    {
        this.namespace = namespace;
        this.topic = topic;
    }

    @JsonIgnore
    public GetTopicByTopicName createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
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
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("topic","topic");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "topic"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.topic == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ModelNotificationTopicResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelNotificationTopicResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}