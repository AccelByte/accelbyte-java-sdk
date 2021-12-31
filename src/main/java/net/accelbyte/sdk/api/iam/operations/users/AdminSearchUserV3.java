package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelSearchUsersResponseWithPaginationV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
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
    private String offset;
    private String platformBy;
    private String platformId;
    private String query;
    private String startDate;

    /**
    * @param namespace required
    */
    public AdminSearchUserV3(
            String namespace,
            String by,
            String endDate,
            Integer limit,
            String offset,
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

    public AdminSearchUserV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("by", this.by);
        queryParams.put("endDate", this.endDate);
        queryParams.put("limit", String.valueOf(this.limit));
        queryParams.put("offset", this.offset);
        queryParams.put("platformBy", this.platformBy);
        queryParams.put("platformId", this.platformId);
        queryParams.put("query", this.query);
        queryParams.put("startDate", this.startDate);
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

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
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelSearchUsersResponseWithPaginationV3 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelSearchUsersResponseWithPaginationV3().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
