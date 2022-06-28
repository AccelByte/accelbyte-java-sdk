/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.roles;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelRoleV4Response;
import net.accelbyte.sdk.api.iam.models.ModelRoleV4Request;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * AdminUpdateRoleV4
 *
 * Required permission ADMIN:ROLE [UPDATE]
 * 
 * Update role request body:
 * - roleName: specify role name, alphanumeric, cannot have special character (required)
 * - adminRole: specify if role is for admin user (default false)
 * - isWildcard: specify if role can be assigned to wildcard (*) namespace (default false)
 * - deletable: specify if role can be deleted (optional)
 * 
 * action code: 10402
 */
@Getter
@Setter
public class AdminUpdateRoleV4 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v4/admin/roles/{roleId}";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String roleId;
    private ModelRoleV4Request body;

    /**
    * @param roleId required
    * @param body required
    */
    @Builder
    public AdminUpdateRoleV4(
            String roleId,
            ModelRoleV4Request body
    )
    {
        this.roleId = roleId;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.roleId != null){
            pathParams.put("roleId", this.roleId);
        }
        return pathParams;
    }



    @Override
    public ModelRoleV4Request getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.roleId == null) {
            return false;
        }
        return true;
    }

    public ModelRoleV4Response parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelRoleV4Response().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}