/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.agreement;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.models.AcceptAgreementResponse;
import net.accelbyte.sdk.api.legal.models.AcceptAgreementRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * bulkAcceptVersionedPolicy
 *
 * Accepts many legal policy versions all at once. Supply with localized version policy id to accept an agreement.
 * Other detail info:
 * 
 *   * Required permission : login user
 */
@Getter
@Setter
public class BulkAcceptVersionedPolicy extends Operation {
    /**
     * generated field's value
     */
    private String url = "/agreement/public/agreements/policies";
    private String method = "POST";
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
    public BulkAcceptVersionedPolicy(
            List<AcceptAgreementRequest> body
    )
    {
        this.body = body;
        
        securities.add("Bearer");
    }

    public BulkAcceptVersionedPolicy createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }




    @Override
    public List<AcceptAgreementRequest> getBodyParams(){
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
    public AcceptAgreementResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new AcceptAgreementResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}