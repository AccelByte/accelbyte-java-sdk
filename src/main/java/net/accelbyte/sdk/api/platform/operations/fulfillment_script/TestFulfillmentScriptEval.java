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
import net.accelbyte.sdk.api.platform.models.FulfillmentScriptEvalTestResult;
import net.accelbyte.sdk.api.platform.models.FulfillmentScriptEvalTestRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * testFulfillmentScriptEval
 *
 *  [TEST FACILITY ONLY] Test eval fulfillment script.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:FULFILLMENT", action=2 (READ)
 */
@Getter
@Setter
public class TestFulfillmentScriptEval extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/fulfillment/scripts/tests/eval";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList();
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private FulfillmentScriptEvalTestRequest body;

    /**
    */
    @Builder
    public TestFulfillmentScriptEval(
            FulfillmentScriptEvalTestRequest body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
    }

    public TestFulfillmentScriptEval createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }




    @Override
    public FulfillmentScriptEvalTestRequest getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        return true;
    }

    @Override
    public FulfillmentScriptEvalTestResult parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new FulfillmentScriptEvalTestResult().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}