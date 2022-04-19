/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.party;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.models.ModelsPartyData;
import net.accelbyte.sdk.api.lobby.models.ModelsPartyPUTCustomAttributesRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * publicUpdatePartyAttributesV1
 *
 * Required valid user authorization
 * 
 * 
 * update party attributes in a namespace.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class PublicUpdatePartyAttributesV1 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/lobby/v1/public/party/namespaces/{namespace}/parties/{partyId}/attributes";

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
    private String partyId;
    private ModelsPartyPUTCustomAttributesRequest body;

    /**
    * @param namespace required
    * @param partyId required
    * @param body required
    */
    @Builder
    public PublicUpdatePartyAttributesV1(
            String namespace,
            String partyId,
            ModelsPartyPUTCustomAttributesRequest body
    )
    {
        this.namespace = namespace;
        this.partyId = partyId;
        this.body = body;
    }

    @JsonIgnore
    public PublicUpdatePartyAttributesV1 createFromJson(String json) throws JsonProcessingException {
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
        if (this.partyId != null){
            pathParams.put("partyId", this.partyId);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public ModelsPartyPUTCustomAttributesRequest getBodyParams(){
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
        result.put("partyId","partyId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "partyId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.partyId == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ModelsPartyData parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsPartyData().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}