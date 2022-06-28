/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.public_group;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateGroupResponse;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateGroupRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * UpdateGroup
 *
 * Required permission NAMESPACE:{namespace}:USER:{userId}:CONTENTGROUP [UPDATE]
 * replace group name and contents with new ones
 */
@Getter
@Setter
public class UpdateGroup extends Operation {
    /**
     * generated field's value
     */
    private String path = "/ugc/v1/public/namespaces/{namespace}/users/{userId}/groups/{groupId}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json","application/octet-stream");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String groupId;
    private String namespace;
    private String userId;
    private ModelsCreateGroupRequest body;

    /**
    * @param groupId required
    * @param namespace required
    * @param userId required
    * @param body required
    */
    @Builder
    public UpdateGroup(
            String groupId,
            String namespace,
            String userId,
            ModelsCreateGroupRequest body
    )
    {
        this.groupId = groupId;
        this.namespace = namespace;
        this.userId = userId;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.groupId != null){
            pathParams.put("groupId", this.groupId);
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
    public ModelsCreateGroupRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.groupId == null) {
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

    public ModelsCreateGroupResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsCreateGroupResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}