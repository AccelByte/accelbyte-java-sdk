/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.agreement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.models.AcceptAgreementRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * changePreferenceConsent_1
 *
 * Change marketing preference consent.
 * Other detail info:
 * 
 *   * Required permission : login user
 */
@Getter
@Setter
public class ChangePreferenceConsent1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/agreement/public/agreements/localized-policy-versions/preferences";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private List<AcceptAgreementRequest> body;

    /**
    */
    @Builder
    public ChangePreferenceConsent1(
            List<AcceptAgreementRequest> body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
    }




    @Override
    public List<AcceptAgreementRequest> getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        return true;
    }

    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}