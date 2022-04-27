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
import net.accelbyte.sdk.api.group.models.ModelsKickGroupMemberResponseV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * kickGroupMemberPublicV1
 *
 * 
 * 
 * Required valid user authentication
 * 
 * 
 * 
 * 
 * Required Member Role Permission: "GROUP:KICK [CREATE]"
 * 
 * 
 * 
 * 
 * This endpoint is used to kick group member.
 * 
 * 
 * 
 * 
 * Kick group member. This endpoint will check the member and group information, and also the role permission of the the user who accesses this endpoint
 * 
 * 
 * 
 * 
 * Action Code: 73409
 */
@Getter
@Setter
public class KickGroupMemberPublicV1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/group/v1/public/namespaces/{namespace}/users/{userId}/kick";
    private String method = "POST";
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
    public KickGroupMemberPublicV1(
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

    public ModelsKickGroupMemberResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsKickGroupMemberResponseV1().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}