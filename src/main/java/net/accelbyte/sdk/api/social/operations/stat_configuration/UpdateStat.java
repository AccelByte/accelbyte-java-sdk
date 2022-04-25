/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.stat_configuration;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.models.StatInfo;
import net.accelbyte.sdk.api.social.models.StatUpdate;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updateStat
 *
 * Update stat.
 * Other detail info:
 *           *  Required permission : resource="ADMIN:NAMESPACE:{namespace}:STAT", action=4 (UPDATE)
 *           *  Returns : updated stat
 */
@Getter
@Setter
public class UpdateStat extends Operation {
    /**
     * generated field's value
     */
    private String url = "/social/v1/admin/namespaces/{namespace}/stats/{statCode}";
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
    private StatUpdate body;

    /**
    * @param namespace required
    * @param statCode required
    */
    @Builder
    public UpdateStat(
            String namespace,
            String statCode,
            StatUpdate body
    )
    {
        this.namespace = namespace;
        this.statCode = statCode;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateStat createFromJson(String json) throws JsonProcessingException {
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
        if (this.statCode != null){
            pathParams.put("statCode", this.statCode);
        }
        return pathParams;
    }



    @Override
    public StatUpdate getBodyParams(){
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
        if(this.statCode == null) {
            return false;
        }
        return true;
    }

    @Override
    public StatInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new StatInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}