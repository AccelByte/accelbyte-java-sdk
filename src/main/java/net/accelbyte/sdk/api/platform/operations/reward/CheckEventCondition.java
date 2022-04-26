/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.reward;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.ConditionMatchResult;
import net.accelbyte.sdk.api.platform.models.EventPayload;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * checkEventCondition
 *
 *  [TEST FACILITY ONLY] Forbidden in live environment. Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:REWARD", action=2 (READ)
 *   *  Returns : match result
 */
@Getter
@Setter
public class CheckEventCondition extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/namespaces/{namespace}/rewards/{rewardId}/match";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String rewardId;
    private EventPayload body;

    /**
    * @param namespace required
    * @param rewardId required
    */
    @Builder
    public CheckEventCondition(
            String namespace,
            String rewardId,
            EventPayload body
    )
    {
        this.namespace = namespace;
        this.rewardId = rewardId;
        this.body = body;
        
        securities.add("Bearer");
    }

    public CheckEventCondition createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.rewardId != null){
            pathParams.put("rewardId", this.rewardId);
        }
        return pathParams;
    }



    @Override
    public EventPayload getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.rewardId == null) {
            return false;
        }
        return true;
    }

    public ConditionMatchResult parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ConditionMatchResult().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}