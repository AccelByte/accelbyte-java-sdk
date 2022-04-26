/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.operations.pass;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.seasonpass.models.*;
import net.accelbyte.sdk.api.seasonpass.models.PassInfo;
import net.accelbyte.sdk.api.seasonpass.models.PassUpdate;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updatePass
 *
 * This API is used to update a pass. Only draft season pass can be updated.
 * 
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:SEASONPASS", action=4 (UPDATE)
 *   *  Returns : updated pass
 */
@Getter
@Setter
public class UpdatePass extends Operation {
    /**
     * generated field's value
     */
    private String url = "/seasonpass/admin/namespaces/{namespace}/seasons/{seasonId}/passes/{code}";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String code;
    private String namespace;
    private String seasonId;
    private PassUpdate body;

    /**
    * @param code required
    * @param namespace required
    * @param seasonId required
    */
    @Builder
    public UpdatePass(
            String code,
            String namespace,
            String seasonId,
            PassUpdate body
    )
    {
        this.code = code;
        this.namespace = namespace;
        this.seasonId = seasonId;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdatePass createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.code != null){
            pathParams.put("code", this.code);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.seasonId != null){
            pathParams.put("seasonId", this.seasonId);
        }
        return pathParams;
    }



    @Override
    public PassUpdate getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.code == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.seasonId == null) {
            return false;
        }
        return true;
    }

    public PassInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new PassInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}