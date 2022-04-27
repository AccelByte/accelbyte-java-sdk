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
import net.accelbyte.sdk.api.iam.models.ModelInviteUserResponseV3;
import net.accelbyte.sdk.api.iam.models.ModelInviteUserRequestV4;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * AdminInviteUserV4
 *
 * Required permission 'ADMIN:USER:INVITE [CREATE]
 * 
 * Use this endpoint to invite admin or non-admin user and assign role to them. The role must be scoped to namespace. An admin user can only
 * assign role with namespaces that the admin user has required permission which is same as the required permission of endpoint: [AdminAddUserRoleV4].
 * Role is optional, if not specified then it will only assign User role
 * 
 * The invited admin will also assigned with "User" role by default.
 */
@Getter
@Setter
public class AdminInviteUserV4 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v4/admin/users/users/invite";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private ModelInviteUserRequestV4 body;

    /**
    * @param body required
    */
    @Builder
    public AdminInviteUserV4(
            ModelInviteUserRequestV4 body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
    }




    @Override
    public ModelInviteUserRequestV4 getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        return true;
    }

    public ModelInviteUserResponseV3 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelInviteUserResponseV3().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}