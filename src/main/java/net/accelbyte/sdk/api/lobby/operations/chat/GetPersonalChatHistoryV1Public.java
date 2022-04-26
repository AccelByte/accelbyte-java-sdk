/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.chat;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

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
public class GetPersonalChatHistoryV1Public extends Operation {
    /**
     * generated field's value
     */
    private String url = "/lobby/v1/public/chat/namespaces/{namespace}/users/me/friends/{friendId}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
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
    @Builder
    public GetPersonalChatHistoryV1Public(
            String friendId,
            String namespace
    )
    {
        this.friendId = friendId;
        this.namespace = namespace;
        
        securities.add("Bearer");
    }

    public GetPersonalChatHistoryV1Public createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
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
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.friendId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public List<ModelChatMessageResponse> parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<ModelChatMessageResponse>>() {});
        }
        throw new HttpResponseException(code, json);
    }

}