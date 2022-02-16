/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.seasonpass.operations.season;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.seasonpass.models.*;
import net.accelbyte.sdk.api.seasonpass.models.Ownership;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * existsAnyPassByPassCodes
 *
 * [SERVICE COMMUNICATION ONLY]This API is used to get ownership for any pass codes, season only located in non-publisher namespace.
 * 
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:SEASONPASS", action=2 (READ)
 *   *  Returns : ownership
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class ExistsAnyPassByPassCodes extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/current/passes/ownership/any";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList();

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
    private String userId;
    private List<String> passCodes;

    /**
    * @param namespace required
    * @param userId required
    */
    public ExistsAnyPassByPassCodes(
            String namespace,
            String userId,
            List<String> passCodes
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.passCodes = passCodes;
    }

    @JsonIgnore
    public ExistsAnyPassByPassCodes createFromJson(String json) throws JsonProcessingException {
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
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("passCodes", this.passCodes == null ? null : this.passCodes);
        return queryParams;
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
        result.put("userId","userId");
        result.put("passCodes","passCodes");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "userId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public Ownership parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new Ownership().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("passCodes", "multi");
        return result;
    }
}