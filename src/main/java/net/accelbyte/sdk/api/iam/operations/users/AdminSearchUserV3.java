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
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelSearchUsersResponseWithPaginationV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminSearchUserV3
 *
 * 
 * 
 * Required permission ADMIN:NAMESPACE:{namespace}:USER [READ]
 * 
 * 
 * 
 * 
 * Endpoint behavior :
 * 
 *           * by default this endpoint searches all users on the specified namespace
 * 
 * 
 *           * if query parameter is defined, endpoint will search users whose email address, display name, username, or third party partially match with the query
 * 
 * 
 *           * if startDate and endDate parameters is defined, endpoint will search users which created on the certain date range
 * 
 * 
 *           * if query, startDate and endDate parameters are defined, endpoint will search users whose email address and display name match and created on the certain date range
 * 
 * 
 *           * if startDate parameter is defined, endpoint will search users that created start from the defined date
 * 
 * 
 *           * if endDate parameter is defined, endpoint will search users that created until the defined date
 * 
 * 
 *           * if platformId parameter is defined and by parameter is using thirdparty, endpoint will search users based on the platformId they have linked to
 * 
 * 
 *           * if platformBy parameter is defined and by parameter is using thirdparty, endpoint will search users based on the platformUserId or platformDisplayName they have linked to, example value: platformUserId or platformDisplayName
 * 
 * 
 *           * if limit is not defined, The default limit is 100
 * 
 * 
 * 
 * 
 * 
 * action code : 10133
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminSearchUserV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/admin/namespaces/{namespace}/users/search";

    @JsonIgnore
    private String method = "GET";

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
    private String by;
    private String endDate;
    private Integer limit;
    private Integer offset;
    private String platformBy;
    private String platformId;
    private String query;
    private String startDate;

    /**
    * @param namespace required
    */
    @Builder
    public AdminSearchUserV3(
            String namespace,
            String by,
            String endDate,
            Integer limit,
            Integer offset,
            String platformBy,
            String platformId,
            String query,
            String startDate
    )
    {
        this.namespace = namespace;
        this.by = by;
        this.endDate = endDate;
        this.limit = limit;
        this.offset = offset;
        this.platformBy = platformBy;
        this.platformId = platformId;
        this.query = query;
        this.startDate = startDate;
    }

    @JsonIgnore
    public AdminSearchUserV3 createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("by", this.by == null ? null : Arrays.asList(this.by));
        queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("platformBy", this.platformBy == null ? null : Arrays.asList(this.platformBy));
        queryParams.put("platformId", this.platformId == null ? null : Arrays.asList(this.platformId));
        queryParams.put("query", this.query == null ? null : Arrays.asList(this.query));
        queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
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
        result.put("by","by");
        result.put("endDate","endDate");
        result.put("limit","limit");
        result.put("offset","offset");
        result.put("platformBy","platformBy");
        result.put("platformId","platformId");
        result.put("query","query");
        result.put("startDate","startDate");
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
    public ModelSearchUsersResponseWithPaginationV3 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelSearchUsersResponseWithPaginationV3().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("by", "None");
        result.put("endDate", "None");
        result.put("limit", "None");
        result.put("offset", "None");
        result.put("platformBy", "None");
        result.put("platformId", "None");
        result.put("query", "None");
        result.put("startDate", "None");
        return result;
    }
}