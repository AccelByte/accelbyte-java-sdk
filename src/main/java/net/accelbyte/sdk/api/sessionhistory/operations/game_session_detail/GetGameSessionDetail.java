/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.operations.game_session_detail;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.sessionhistory.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getGameSessionDetail
 *
 * Get game session detail.
 */
@Getter
@Setter
public class GetGameSessionDetail extends Operation {
    /**
     * generated field's value
     */
    private String path = "/sessionhistory/v1/admin/namespaces/{namespace}/gamesessions/{sessionId}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String sessionId;

    /**
    * @param namespace required
    * @param sessionId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public GetGameSessionDetail(
            String namespace,
            String sessionId
    )
    {
        this.namespace = namespace;
        this.sessionId = sessionId;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.sessionId != null){
            pathParams.put("sessionId", this.sessionId);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.sessionId == null) {
            return false;
        }
        return true;
    }

    public ApimodelsGameSessionDetail parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);    
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ApimodelsGameSessionDetail().createFromJson(json);
    }

}