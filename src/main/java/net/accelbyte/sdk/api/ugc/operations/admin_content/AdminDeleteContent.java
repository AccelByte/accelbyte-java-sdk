/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.admin_content;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * AdminDeleteContent
 *
 * Required permission ADMIN:NAMESPACE:{namespace}:USER:{userId}:CONTENT [DELETE].
 */
@Getter
@Setter
public class AdminDeleteContent extends Operation {
    /**
     * generated field's value
     */
    private String path = "/ugc/v1/admin/namespaces/{namespace}/users/{userId}/channels/{channelId}/contents/{contentId}";
    private String method = "DELETE";
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
    private String userId;

    /**
    * @param channelId required
    * @param contentId required
    * @param namespace required
    * @param userId required
    */
    @Builder
    public AdminDeleteContent(
            String channelId,
            String contentId,
            String namespace,
            String userId
    )
    {
        this.channelId = channelId;
        this.contentId = contentId;
        this.namespace = namespace;
        this.userId = userId;
        
        securities.add("Bearer");
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
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
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
        if(this.userId == null) {
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