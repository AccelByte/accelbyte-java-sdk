/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelGetAdminUsersResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * GetAdminUsersByRoleID
 *
 * 
 * 
 * Required permission 'ADMIN:NAMESPACE:{namespace}:USER [READ]'
 * 
 * 
 * 
 * 
 * This endpoint search admin users which have the roleId
 * 
 * 
 * 
 * 
 * Notes : this endpoint only accept admin role. Admin Role is role which have admin status and members.
 * Use endpoint [GET] /roles/{roleId}/admin to check the role status
 */
@Getter
@Setter
public class GetAdminUsersByRoleID extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/namespaces/{namespace}/users/admin";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private Integer after;
    private Integer before;
    private Integer limit;
    private String roleId;

    /**
    * @param namespace required
    */
    @Builder
    public GetAdminUsersByRoleID(
            String namespace,
            Integer after,
            Integer before,
            Integer limit,
            String roleId
    )
    {
        this.namespace = namespace;
        this.after = after;
        this.before = before;
        this.limit = limit;
        this.roleId = roleId;
        
        securities.add("Bearer");
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("after", this.after == null ? null : Arrays.asList(String.valueOf(this.after)));
        queryParams.put("before", this.before == null ? null : Arrays.asList(String.valueOf(this.before)));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("roleId", this.roleId == null ? null : Arrays.asList(this.roleId));
        return queryParams;
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

    public ModelGetAdminUsersResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelGetAdminUsersResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("after", "None");
        result.put("before", "None");
        result.put("limit", "None");
        result.put("roleId", "None");
        return result;
    }
}