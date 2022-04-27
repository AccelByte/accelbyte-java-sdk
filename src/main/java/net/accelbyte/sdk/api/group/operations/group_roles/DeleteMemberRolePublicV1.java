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
import net.accelbyte.sdk.api.group.models.ModelsUpdateMemberRoleResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsRemoveRoleFromMemberRequestV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * deleteMemberRolePublicV1
 *
 * Required Member Role Permission: "GROUP:ROLE [UPDATE]"
 * 
 * 
 * 
 * 
 * This endpoint is used to remove role from group member
 * 
 * 
 * 
 * 
 * Action Code: 73204
 */
@Getter
@Setter
public class DeleteMemberRolePublicV1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/group/v1/public/namespaces/{namespace}/roles/{memberRoleId}/members";
    private String method = "DELETE";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String memberRoleId;
    private String namespace;
    private ModelsRemoveRoleFromMemberRequestV1 body;

    /**
    * @param memberRoleId required
    * @param namespace required
    * @param body required
    */
    @Builder
    public DeleteMemberRolePublicV1(
            String memberRoleId,
            String namespace,
            ModelsRemoveRoleFromMemberRequestV1 body
    )
    {
        this.memberRoleId = memberRoleId;
        this.namespace = namespace;
        this.body = body;
        
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
    public ModelsRemoveRoleFromMemberRequestV1 getBodyParams(){
        return this.body;
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

    public ModelsUpdateMemberRoleResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsUpdateMemberRoleResponseV1().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}