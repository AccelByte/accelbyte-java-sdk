/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.operations.session;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsAddPlayerResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * RemovePlayerFromSession
 *
 * Required permission: NAMESPACE:{namespace}:SESSIONBROWSER:SESSION [UPDATE]
 * 
 * Required scope: social
 * 
 * Remove player from game session
 */
@Getter
@Setter
public class RemovePlayerFromSession extends Operation {
    /**
     * generated field's value
     */
    private String path = "/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}/player/{userID}";
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
    private String sessionID;
    private String userID;

    /**
    * @param namespace required
    * @param sessionID required
    * @param userID required
    */
    @Builder
    public RemovePlayerFromSession(
            String namespace,
            String sessionID,
            String userID
    )
    {
        this.namespace = namespace;
        this.sessionID = sessionID;
        this.userID = userID;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.sessionID != null){
            pathParams.put("sessionID", this.sessionID);
        }
        if (this.userID != null){
            pathParams.put("userID", this.userID);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.sessionID == null) {
            return false;
        }
        if(this.userID == null) {
            return false;
        }
        return true;
    }

    public ModelsAddPlayerResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsAddPlayerResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}