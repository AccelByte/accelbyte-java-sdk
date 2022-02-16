/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.lobby.operations.chat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * getPersonalChatHistoryV1Public
 *
 * Required valid user authorization
 * 
 * 
 * load personal chat history in a namespace based on Friend User ID
 * 
 * Action Code: 50101
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class GetPersonalChatHistoryV1Public extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/lobby/v1/public/chat/namespaces/{namespace}/users/me/friends/{friendId}";

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
    private String friendId;
    private String namespace;

    /**
    * @param friendId required
    * @param namespace required
    */
    public GetPersonalChatHistoryV1Public(
            String friendId,
            String namespace
    )
    {
        this.friendId = friendId;
        this.namespace = namespace;
    }

    @JsonIgnore
    public GetPersonalChatHistoryV1Public createFromJson(String json) throws JsonProcessingException {
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
        if (this.friendId != null){
            pathParams.put("friendId", this.friendId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
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
        result.put("friendId","friendId");
        result.put("namespace","namespace");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "friendId",
            "namespace"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.friendId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public List<ModelChatMessageResponse> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<ModelChatMessageResponse>>() {});
        }
        throw new ResponseException(code, json);
    }

}