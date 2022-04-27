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
import net.accelbyte.sdk.api.iam.models.ModelUserCreateResponseV3;
import net.accelbyte.sdk.api.iam.models.ModelUserCreateFromInvitationRequestV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * CreateUserFromInvitationV3
 *
 * This endpoint create user from saved roles when creating invitation and submitted data.
 * User will be able to login after completing submitting the data through this endpoint.
 * Available Authentication Types:
 * 
 * EMAILPASSWD: an authentication type used for new user registration through email.
 * 
 * Country use ISO3166-1 alpha-2 two letter, e.g. US.
 * 
 * Date of Birth format : YYYY-MM-DD, e.g. 2019-04-29.
 */
@Getter
@Setter
public class CreateUserFromInvitationV3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v3/public/namespaces/{namespace}/users/invite/{invitationId}";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String invitationId;
    private String namespace;
    private ModelUserCreateFromInvitationRequestV3 body;

    /**
    * @param invitationId required
    * @param namespace required
    * @param body required
    */
    @Builder
    public CreateUserFromInvitationV3(
            String invitationId,
            String namespace,
            ModelUserCreateFromInvitationRequestV3 body
    )
    {
        this.invitationId = invitationId;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.invitationId != null){
            pathParams.put("invitationId", this.invitationId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelUserCreateFromInvitationRequestV3 getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.invitationId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelUserCreateResponseV3 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelUserCreateResponseV3().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}