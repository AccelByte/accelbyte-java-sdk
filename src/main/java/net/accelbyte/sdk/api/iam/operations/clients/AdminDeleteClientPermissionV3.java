/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.iam.operations.clients;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminDeleteClientPermissionV3
 *
 * Required permission 'ADMIN:NAMESPACE:{namespace}:CLIENT [UPDATE]'
 * action code : 10304
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminDeleteClientPermissionV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/admin/namespaces/{namespace}/clients/{clientId}/permissions/{resource}/{action}";

    @JsonIgnore
    private String method = "DELETE";

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
    private Integer action;
    private String clientId;
    private String namespace;
    private String resource;

    /**
    * @param action required
    * @param clientId required
    * @param namespace required
    * @param resource required
    */
    public AdminDeleteClientPermissionV3(
            Integer action,
            String clientId,
            String namespace,
            String resource
    )
    {
        this.action = action;
        this.clientId = clientId;
        this.namespace = namespace;
        this.resource = resource;
    }

    @JsonIgnore
    public AdminDeleteClientPermissionV3 createFromJson(String json) throws JsonProcessingException {
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
        if (this.action != null){
            pathParams.put("action", this.action == null ? null : String.valueOf(this.action));
        }
        if (this.clientId != null){
            pathParams.put("clientId", this.clientId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.resource != null){
            pathParams.put("resource", this.resource);
        }
        return pathParams;
    }




    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("action","action");
        result.put("clientId","clientId");
        result.put("namespace","namespace");
        result.put("resource","resource");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "action",
            "clientId",
            "namespace",
            "resource"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.action == null) {
            return false;
        }
        if(this.clientId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.resource == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}