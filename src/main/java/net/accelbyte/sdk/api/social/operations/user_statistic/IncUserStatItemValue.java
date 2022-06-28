/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.user_statistic;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.models.StatItemIncResult;
import net.accelbyte.sdk.api.social.models.StatItemInc;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * incUserStatItemValue
 *
 * Update user's statitem value.
 * Other detail info:
 *               *  Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:STATITEM", action=4 (UPDATE)
 *               *  Returns : updated user's statItem
 */
@Getter
@Setter
public class IncUserStatItemValue extends Operation {
    /**
     * generated field's value
     */
    private String path = "/social/v1/admin/namespaces/{namespace}/users/{userId}/stats/{statCode}/statitems/value";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String statCode;
    private String userId;
    private StatItemInc body;

    /**
    * @param namespace required
    * @param statCode required
    * @param userId required
    */
    @Builder
    public IncUserStatItemValue(
            String namespace,
            String statCode,
            String userId,
            StatItemInc body
    )
    {
        this.namespace = namespace;
        this.statCode = statCode;
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
        if (this.statCode != null){
            pathParams.put("statCode", this.statCode);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }



    @Override
    public StatItemInc getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.statCode == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public StatItemIncResult parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new StatItemIncResult().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}