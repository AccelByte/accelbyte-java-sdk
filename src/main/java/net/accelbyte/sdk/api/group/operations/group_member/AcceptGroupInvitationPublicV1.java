/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.group.operations.group_member;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.models.ModelsMemberRequestGroupResponseV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * acceptGroupInvitationPublicV1
 *
 * 
 * 
 * Required valid user authentication
 * 
 * 
 * 
 * 
 * This endpoint is used to accept group invitation.
 * 
 * 
 * 
 * 
 * Accept group invitation. If specific user is not invited in the specific group ID, it will show the the error to show if the user is not invited yet.
 * 
 * 
 * 
 * 
 * This endpoint will also check if the user who access this endpoint is already joined to specific group
 * 
 * 
 * 
 * 
 * Accessing this endpoint will make all requests (invite / join request) will be deleted for the user who access this endpoint
 * 
 * 
 * 
 * 
 * Existing members will receive notification of newly accepted member.
 * 
 * 
 * 
 * 
 * Action Code: 73401
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AcceptGroupInvitationPublicV1 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/group/v1/public/namespaces/{namespace}/groups/{groupId}/invite/accept";

    @JsonIgnore
    private String method = "POST";

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
    private String groupId;
    private String namespace;

    /**
    * @param groupId required
    * @param namespace required
    */
    public AcceptGroupInvitationPublicV1(
            String groupId,
            String namespace
    )
    {
        this.groupId = groupId;
        this.namespace = namespace;
    }

    @JsonIgnore
    public AcceptGroupInvitationPublicV1 createFromJson(String json) throws JsonProcessingException {
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
        if (this.groupId != null){
            pathParams.put("groupId", this.groupId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
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
        result.put("groupId","groupId");
        result.put("namespace","namespace");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "groupId",
            "namespace"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.groupId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ModelsMemberRequestGroupResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsMemberRequestGroupResponseV1().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}