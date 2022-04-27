/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelInviteUserResponseV3;
import net.accelbyte.sdk.api.iam.models.ModelInviteUserRequestV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * AdminInviteUserV3
 *
 * Required permission 'ADMIN:NAMESPACE:{namespace}:USER:INVITE [CREATE]
 * 
 * Use this endpoint to invite admin or non-admin user and assign role to them. The role must be scoped to namespace.
 * Substitute the namespace in path parameter to desired role's namespace'. An admin user can only
 * assign role to namespaces that the admin user has the required permission.
 * Role is optional, if not specified then it will only assign User role
 * 
 * The invited admin will also assigned with "User" role by default.
 */
@Getter
@Setter
public class AdminInviteUserV3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v3/admin/namespaces/{namespace}/users/invite";
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
    private ModelInviteUserRequestV3 body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    public AdminInviteUserV3(
            String namespace,
            ModelInviteUserRequestV3 body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelInviteUserRequestV3 getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
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