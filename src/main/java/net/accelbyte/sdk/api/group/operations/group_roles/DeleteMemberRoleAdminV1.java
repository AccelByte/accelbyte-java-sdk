/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.group_roles;

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
 * deleteMemberRoleAdminV1
 *
 * 
 * 
 * Required permission ADMIN:NAMESPACE:{namespace}:GROUP:ROLE [DELETE]
 * 
 * 
 * 
 * 
 * This endpoint is used to delete member role. Any member role can't be deleted if the specific role is applied to the configuration (admin and member role)
 * 
 * 
 * 
 * 
 * Action Code: 73207
 */
@Getter
@Setter
public class DeleteMemberRoleAdminV1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/group/v1/admin/namespaces/{namespace}/roles/{memberRoleId}";
    private String method = "DELETE";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String memberRoleId;
    private String namespace;

    /**
    * @param memberRoleId required
    * @param namespace required
    */
    @Builder
    public DeleteMemberRoleAdminV1(
            String memberRoleId,
            String namespace
    )
    {
        this.memberRoleId = memberRoleId;
        this.namespace = namespace;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.memberRoleId != null){
            pathParams.put("memberRoleId", this.memberRoleId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.memberRoleId == null) {
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