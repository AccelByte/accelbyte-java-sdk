/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.group_member;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.models.ModelsJoinGroupResponseV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * JoinGroupV1
 *
 * 
 * 
 * Required valid user authentication
 * 
 * 
 * 
 * 
 * This endpoint is used to join as group member
 * 
 * 
 * 
 * 
 * Join to the group. This endpoint will check the the the type of the group based on the groupID.
 * 
 * 
 * 
 * 
 * Additional Information:
 * 
 * 
 * 
 * 
 * 
 * 
 *   * User cannot join to the group with PRIVATE type
 * 
 * 
 *   * Joining PUBLIC group type will create join request and need approval from the privileged group member to accept the request to become the member
 * 
 * 
 *   * Joining OPEN group type will make this user become member of that group immediately
 * 
 * 
 * 
 * 
 * 
 * This endpoint will return status field to give information whether the user is JOINED or REQUESTED to join to the specific group
 * 
 * 
 * 
 * 
 * Action Code: 73403
 */
@Getter
@Setter
public class JoinGroupV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/group/v1/public/namespaces/{namespace}/groups/{groupId}/join";
    private String method = "POST";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
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
    @Builder
    public JoinGroupV1(
            String groupId,
            String namespace
    )
    {
        this.groupId = groupId;
        this.namespace = namespace;
        
        securities.add("Bearer");
    }

    public JoinGroupV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
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
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.groupId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelsJoinGroupResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelsJoinGroupResponseV1().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}