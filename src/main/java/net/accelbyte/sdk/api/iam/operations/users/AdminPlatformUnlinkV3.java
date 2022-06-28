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
import net.accelbyte.sdk.api.iam.models.ModelUnlinkUserPlatformRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * AdminPlatformUnlinkV3
 *
 * 
 * 
 * Required permission 'ADMIN:NAMESPACE:{namespace}:USER:{userId} [DELETE]'.
 * 
 * 
 * ## Supported platforms:
 * 
 * 
 * 
 * 
 *                 * steam
 * 
 * 
 *                 * steamopenid
 * 
 * 
 *                 * facebook
 * 
 * 
 *                 * google
 * 
 * 
 *                 * oculus
 * 
 * 
 *                 * twitch
 * 
 * 
 *                 * android
 * 
 * 
 *                 * ios
 * 
 * 
 *                 * apple
 * 
 * 
 *                 * device
 * 
 * 
 *                 * discord
 * 
 * 
 *                 * awscognito
 * 
 * 
 *                 * epicgames
 * 
 * 
 *                 * nintendo
 * 
 * 
 *                 * stadia
 * 
 * 
 * 
 * 
 * Unlink user's account from a specific platform. 'justice' platform might have multiple accounts from different namespaces linked.
 * 
 * platformNamespace need to be specified when the platform ID is 'justice'.
 * 
 * 
 * 
 * Unlink user's account from justice platform will enable password token grant and password update.
 * 
 * 
 * 
 * If you want to unlink user's account in a game namespace, you have to specify platformNamespace to that game namespace.
 * 
 * 
 * 
 * action code : 10121
 */
@Getter
@Setter
public class AdminPlatformUnlinkV3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v3/admin/namespaces/{namespace}/users/{userId}/platforms/{platformId}";
    private String method = "DELETE";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String platformId;
    private String userId;
    private ModelUnlinkUserPlatformRequest body;

    /**
    * @param namespace required
    * @param platformId required
    * @param userId required
    * @param body required
    */
    @Builder
    public AdminPlatformUnlinkV3(
            String namespace,
            String platformId,
            String userId,
            ModelUnlinkUserPlatformRequest body
    )
    {
        this.namespace = namespace;
        this.platformId = platformId;
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
        if (this.platformId != null){
            pathParams.put("platformId", this.platformId);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }



    @Override
    public ModelUnlinkUserPlatformRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.platformId == null) {
            return false;
        }
        if(this.userId == null) {
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