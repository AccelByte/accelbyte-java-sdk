/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.admin_channel;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.models.ModelsChannelResponse;
import net.accelbyte.sdk.api.ugc.models.ModelsChannelRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * SingleAdminUpdateChannel
 *
 * Required permission ADMIN:NAMESPACE:{namespace}:USER:{userId}:CHANNEL [UPDATE]
 */
@Getter
@Setter
public class SingleAdminUpdateChannel extends Operation {
    /**
     * generated field's value
     */
    private String path = "/ugc/v1/admin/namespaces/{namespace}/channels/{channelId}";
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
    private String namespace;
    private ModelsChannelRequest body;

    /**
    * @param channelId required
    * @param namespace required
    * @param body required
    */
    @Builder
    public SingleAdminUpdateChannel(
            String channelId,
            String namespace,
            ModelsChannelRequest body
    )
    {
        this.channelId = channelId;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.channelId != null){
            pathParams.put("channelId", this.channelId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelsChannelRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.channelId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelsChannelResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsChannelResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}