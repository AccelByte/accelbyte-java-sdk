/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.lobby.operations.notification;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.models.ModelFreeFormNotificationRequestV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * sendPartyFreeformNotificationV1Admin
 *
 * Required permission : `ADMIN:NAMESPACE:{namespace}:NOTIFICATION [CREATE]` with scope `social`
 * 
 * Sends notification to a party.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class SendPartyFreeformNotificationV1Admin extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/lobby/v1/admin/notification/namespaces/{namespace}/parties/{partyId}/freeform/notify";

    @JsonIgnore
    private String method = "POST";

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
    private ModelFreeFormNotificationRequestV1 body;

    /**
    * @param namespace required
    * @param partyId required
    * @param body required
    */
    public SendPartyFreeformNotificationV1Admin(
            String namespace,
            String partyId,
            ModelFreeFormNotificationRequestV1 body
    )
    {
        this.namespace = namespace;
        this.partyId = partyId;
        this.body = body;
    }

    @JsonIgnore
    public SendPartyFreeformNotificationV1Admin createFromJson(String json) throws JsonProcessingException {
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
    public ModelFreeFormNotificationRequestV1 getBodyParams(){
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
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}