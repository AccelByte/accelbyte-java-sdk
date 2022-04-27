/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.fulfillment_script;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.FulfillmentScriptEvalTestResult;
import net.accelbyte.sdk.api.platform.models.FulfillmentScriptEvalTestRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
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
    private String path = "/platform/admin/fulfillment/scripts/tests/eval";
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




    @Override
    public FulfillmentScriptEvalTestRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        return true;
    }

    public FulfillmentScriptEvalTestResult parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new FulfillmentScriptEvalTestResult().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}