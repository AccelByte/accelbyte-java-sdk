package net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.models.ModelsGetAllLeaderboardConfigsPublicResp;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class GetLeaderboardConfigurationsPublicV1 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/leaderboard/v1/public/namespaces/{namespace}/leaderboards";

    @JsonIgnore
    private String method = "GET";

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
    private Boolean isArchived;
    private Boolean isDeleted;
    private Integer limit;
    private Integer offset;

    /**
    * @param namespace required
    */
    public GetLeaderboardConfigurationsPublicV1(
            String namespace,
            Boolean isArchived,
            Boolean isDeleted,
            Integer limit,
            Integer offset
    )
    {
        this.namespace = namespace;
        this.isArchived = isArchived;
        this.isDeleted = isDeleted;
        this.limit = limit;
        this.offset = offset;
    }

    public GetLeaderboardConfigurationsPublicV1 createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("isArchived", String.valueOf(this.isArchived));
        queryParams.put("isDeleted", String.valueOf(this.isDeleted));
        queryParams.put("limit", String.valueOf(this.limit));
        queryParams.put("offset", String.valueOf(this.offset));
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
        result.put("isArchived","isArchived");
        result.put("isDeleted","isDeleted");
        result.put("limit","limit");
        result.put("offset","offset");
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
    public ModelsGetAllLeaderboardConfigsPublicResp parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsGetAllLeaderboardConfigsPublicResp().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
