/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.group;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * deleteGroupPredefinedRulePublicV1
 *
 * 
 * 
 * Required valid user authentication
 * 
 * 
 * 
 * 
 * Required Member Role Permission: "GROUP [UPDATE]"
 * 
 * 
 * 
 * 
 * Delete group predefined rule based on the allowed action. This endpoint will check the group ID of the user based on the access token
 * and compare it with the group ID in path parameter. It will also check the member role of the user based on
 * the access token
 * 
 * 
 * 
 * 
 * Action Code: 73309
 */
@Getter
@Setter
public class DeleteGroupPredefinedRulePublicV1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/group/v1/public/namespaces/{namespace}/groups/{groupId}/rules/defined/{allowedAction}";
    private String method = "DELETE";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String allowedAction;
    private String groupId;
    private String namespace;

    /**
    * @param allowedAction required
    * @param groupId required
    * @param namespace required
    */
    @Builder
    public DeleteGroupPredefinedRulePublicV1(
            String allowedAction,
            String groupId,
            String namespace
    )
    {
        this.allowedAction = allowedAction;
        this.groupId = groupId;
        this.namespace = namespace;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.allowedAction != null){
            pathParams.put("allowedAction", this.allowedAction);
        }
        if (this.groupId != null){
            pathParams.put("groupId", this.groupId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.allowedAction == null) {
            return false;
        }
        if(this.groupId == null) {
            return false;
        }
        if(this.namespace == null) {
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