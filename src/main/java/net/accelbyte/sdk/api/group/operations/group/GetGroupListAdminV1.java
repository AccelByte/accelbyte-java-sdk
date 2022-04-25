/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.group;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.models.ModelsGetGroupsListResponseV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * getGroupListAdminV1
 *
 * 
 * 
 * Required Permission: "ADMIN:NAMESPACE:{namespace}:GROUP [READ]"
 * 
 * 
 * 
 * 
 * Get list of groups. This endpoint will show any types of group
 * 
 * 
 * 
 * 
 * Action Code: 73301
 */
@Getter
@Setter
public class GetGroupListAdminV1 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/group/v1/admin/namespaces/{namespace}/groups";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String configurationCode;
    private String groupName;
    private String groupRegion;
    private Integer limit;
    private Integer offset;

    /**
    * @param namespace required
    */
    @Builder
    public GetGroupListAdminV1(
            String namespace,
            String configurationCode,
            String groupName,
            String groupRegion,
            Integer limit,
            Integer offset
    )
    {
        this.namespace = namespace;
        this.configurationCode = configurationCode;
        this.groupName = groupName;
        this.groupRegion = groupRegion;
        this.limit = limit;
        this.offset = offset;
        
        securities.add("Bearer");
    }

    public GetGroupListAdminV1 createFromJson(String json) throws JsonProcessingException {
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
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("configurationCode", this.configurationCode == null ? null : Arrays.asList(this.configurationCode));
        queryParams.put("groupName", this.groupName == null ? null : Arrays.asList(this.groupName));
        queryParams.put("groupRegion", this.groupRegion == null ? null : Arrays.asList(this.groupRegion));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
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

    @Override
    public ModelsGetGroupsListResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsGetGroupsListResponseV1().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("configurationCode", "None");
        result.put("groupName", "None");
        result.put("groupRegion", "None");
        result.put("limit", "None");
        result.put("offset", "None");
        return result;
    }
}