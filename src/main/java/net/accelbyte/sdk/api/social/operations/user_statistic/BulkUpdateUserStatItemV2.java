/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.user_statistic;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.models.BulkUserStatItemUpdate;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * bulkUpdateUserStatItemV2
 *
 * Bulk update multiple user's statitems value with specific update strategy.
 * There are four supported update strategies:
 * + *OVERRIDE*: update user statitem with the new value
 * + *INCREMENT*: increment user statitem with the specified value
 * + *MAX*: update user statitem with the specified value if it's larger than the existing value
 * + *MIN*: update user statitem with the specified value if it's lower than the existing value
 * 
 * Other detail info:
 * + *Required permission*: resource="ADMIN:NAMESPACE:{namespace}:STATITEM", action=4 (UPDATE)
 * + *Returns*: bulk updated result
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class BulkUpdateUserStatItemV2 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/social/v2/admin/namespaces/{namespace}/statitems/value/bulk";

    @JsonIgnore
    private String method = "PUT";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private String namespace;
    private List<BulkUserStatItemUpdate> body;

    /**
    * @param namespace required
    */
    @Builder
    public BulkUpdateUserStatItemV2(
            String namespace,
            List<BulkUserStatItemUpdate> body
    )
    {
        this.namespace = namespace;
        this.body = body;
    }

    @JsonIgnore
    public BulkUpdateUserStatItemV2 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public List<BulkUserStatItemUpdate> getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public List<BulkStatItemOperationResult> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<BulkStatItemOperationResult>>() {});
        }
        throw new ResponseException(code, json);
    }

}