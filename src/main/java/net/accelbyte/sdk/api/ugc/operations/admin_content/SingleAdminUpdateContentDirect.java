/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.admin_content;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateContentResponse;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateContentRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * SingleAdminUpdateContentDirect
 *
 * Required permission ADMIN:NAMESPACE:{namespace}:USER:{userId}:CONTENT [UPDATE].
 * 
 * All request body are required except preview and tags.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class SingleAdminUpdateContentDirect extends Operation {
    /**
     * generated field's value
     */
    private String url = "/ugc/v1/admin/namespaces/{namespace}/channels/{channelId}/contents/{contentId}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String channelId;
    private String contentId;
    private String namespace;
    private ModelsCreateContentRequest body;

    /**
    * @param channelId required
    * @param contentId required
    * @param namespace required
    * @param body required
    */
    @Builder
    public SingleAdminUpdateContentDirect(
            String channelId,
            String contentId,
            String namespace,
            ModelsCreateContentRequest body
    )
    {
        this.channelId = channelId;
        this.contentId = contentId;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public SingleAdminUpdateContentDirect createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.channelId != null){
            pathParams.put("channelId", this.channelId);
        }
        if (this.contentId != null){
            pathParams.put("contentId", this.contentId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelsCreateContentRequest getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.channelId == null) {
            return false;
        }
        if(this.contentId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelsCreateContentResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsCreateContentResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}