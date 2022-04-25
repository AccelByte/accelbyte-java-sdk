/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.fulfillment_script;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.FulfillmentScriptInfo;
import net.accelbyte.sdk.api.platform.models.FulfillmentScriptUpdate;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updateFulfillmentScript
 *
 * Update fulfillment script.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:FULFILLMENT", action=4 (UPDATE)
 */
@Getter
@Setter
public class UpdateFulfillmentScript extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/fulfillment/scripts/{id}";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList();
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String id;
    private FulfillmentScriptUpdate body;

    /**
    * @param id required
    */
    @Builder
    public UpdateFulfillmentScript(
            String id,
            FulfillmentScriptUpdate body
    )
    {
        this.id = id;
        this.body = body;
        
        securities.add("Bearer");
    }

    public UpdateFulfillmentScript createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.id != null){
            pathParams.put("id", this.id);
        }
        return pathParams;
    }



    @Override
    public FulfillmentScriptUpdate getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.id == null) {
            return false;
        }
        return true;
    }

    @Override
    public FulfillmentScriptInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new FulfillmentScriptInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}