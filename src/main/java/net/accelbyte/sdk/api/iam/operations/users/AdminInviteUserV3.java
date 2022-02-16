/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelInviteUserResponseV3;
import net.accelbyte.sdk.api.iam.models.ModelInviteUserRequestV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminInviteUserV3
 *
 * Required permission 'ADMIN:NAMESPACE:{namespace}:USER:INVITE [CREATE]
 * 
 * Use this endpoint to invite admin or non-admin user and assign role to them. The role must be scoped to namespace.
 * Substitute the namespace in path parameter to desired role's namespace'. An admin user can only
 * assign role to namespaces that the admin user has the required permission.
 * Role is optional, if not specified then it will only assign User role
 * 
 * The invited admin will also assigned with "User" role by default.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminInviteUserV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/admin/namespaces/{namespace}/users/invite";

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
    private String namespace;
    private ModelInviteUserRequestV3 body;

    /**
    * @param namespace required
    * @param body required
    */
    public AdminInviteUserV3(
            String namespace,
            ModelInviteUserRequestV3 body
    )
    {
        this.namespace = namespace;
        this.body = body;
    }

    @JsonIgnore
    public AdminInviteUserV3 createFromJson(String json) throws JsonProcessingException {
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
    public ModelInviteUserRequestV3 getBodyParams(){
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
    public ModelInviteUserResponseV3 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelInviteUserResponseV3().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}