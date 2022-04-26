/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.party;

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
import net.accelbyte.sdk.core.HttpResponseException;

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
public class PublicUpdatePartyAttributesV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/lobby/v1/public/party/namespaces/{namespace}/parties/{partyId}/attributes";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
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
        
        securities.add("Bearer");
    }

    public PublicUpdatePartyAttributesV1 createFromJson(String json) throws JsonProcessingException {
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
        if (this.partyId != null){
            pathParams.put("partyId", this.partyId);
        }
        return pathParams;
    }



    @Override
    public ModelsPartyPUTCustomAttributesRequest getBodyParams(){
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
        if(this.partyId == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsPartyData parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsPartyData().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}