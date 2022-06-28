/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users_v4;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelListUserRolesV4Response;
import net.accelbyte.sdk.api.iam.models.ModelAddUserRoleV4Request;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * AdminAddUserRoleV4
 *
 * This endpoint requires ADMIN:NAMESPACE:{namespace}:ROLE:USER:* [UPDATE] permission.
 * 
 * New role will be appended to user's current roles. Request body need to specify allowed namespace for given role to support new role restriction.
 * Skipped the check whether the user performing the request is a role manager / assigner since there is a plan to discard the role manager / assigner.
 */
@Getter
@Setter
public class AdminAddUserRoleV4 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v4/admin/namespaces/{namespace}/users/{userId}/roles";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String userId;
    private ModelAddUserRoleV4Request body;

    /**
    * @param namespace required
    * @param userId required
    * @param body required
    */
    @Builder
    public AdminAddUserRoleV4(
            String namespace,
            String userId,
            ModelAddUserRoleV4Request body
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.body = body;
        
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
    public ModelAddUserRoleV4Request getBodyParams(){
        return this.body;
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

    public ModelListUserRolesV4Response parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelListUserRolesV4Response().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}