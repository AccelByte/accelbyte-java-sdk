/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.user_statistic;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.models.BulkUserStatItemInc;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * bulkIncUserStatItemValue
 *
 * Bulk update multiple user's statitems value.
 * Other detail info:
 *           *  Required permission : resource="ADMIN:NAMESPACE:{namespace}:STATITEM", action=4 (UPDATE)
 *           *  Returns : bulk updated result
 */
@Getter
@Setter
public class BulkIncUserStatItemValue extends Operation {
    /**
     * generated field's value
     */
    private String url = "/social/v1/admin/namespaces/{namespace}/statitems/value/bulk";
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
    private List<BulkUserStatItemInc> body;

    /**
    * @param namespace required
    */
    @Builder
    public BulkIncUserStatItemValue(
            String namespace,
            List<BulkUserStatItemInc> body
    )
    {
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    public BulkIncUserStatItemValue createFromJson(String json) throws JsonProcessingException {
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
        return pathParams;
    }



    @Override
    public List<BulkUserStatItemInc> getBodyParams(){
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
        return true;
    }

    public List<BulkStatItemOperationResult> parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<BulkStatItemOperationResult>>() {});
        }
        throw new HttpResponseException(code, json);
    }

}