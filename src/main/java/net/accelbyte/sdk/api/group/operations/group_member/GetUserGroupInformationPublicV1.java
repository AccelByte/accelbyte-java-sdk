/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.group_member;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.models.ModelsGetUserGroupInformationResponseV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * getUserGroupInformationPublicV1
 *
 * 
 * 
 * Required valid user authentication
 * 
 * 
 * 
 * 
 * This endpoint is used to get user group information.
 * 
 * 
 * 
 * 
 * Get user group information. If user does not belong to any group, it will return warning to give information about it
 * 
 * 
 * 
 * 
 * Group Member Status:
 * 
 * 
 * 
 * 
 * 
 * 
 *   * JOIN : status of user requested to join group
 * 
 * 
 *   * INVITE: status of user invited to a group
 * 
 * 
 *   * JOINED: status of user already joined to a group
 * 
 * 
 * 
 * 
 * 
 * Action Code: 73405
 */
@Getter
@Setter
public class GetUserGroupInformationPublicV1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/group/v1/public/namespaces/{namespace}/users/{userId}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String userId;

    /**
    * @param namespace required
    * @param userId required
    */
    @Builder
    public GetUserGroupInformationPublicV1(
            String namespace,
            String userId
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
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
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public ModelsGetUserGroupInformationResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsGetUserGroupInformationResponseV1().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}