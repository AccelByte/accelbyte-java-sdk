package net.accelbyte.sdk.api.matchmaking.operations.matchmaking;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.models.ServiceGetSessionHistorySearchResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class SearchSessions extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/matchmaking/v1/admin/namespaces/{namespace}/sessions/history/search";

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
    private String channel;
    private Boolean deleted;
    private String matchID;
    private String partyID;
    private String userID;
    private Float limit;
    private Float offset;

    /**
    * @param namespace required
    * @param limit required
    * @param offset required
    */
    public SearchSessions(
            String namespace,
            String channel,
            Boolean deleted,
            String matchID,
            String partyID,
            String userID,
            Float limit,
            Float offset
    )
    {
        this.namespace = namespace;
        this.channel = channel;
        this.deleted = deleted;
        this.matchID = matchID;
        this.partyID = partyID;
        this.userID = userID;
        this.limit = limit;
        this.offset = offset;
    }

    public SearchSessions(){
    }

    public SearchSessions createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("channel", this.channel);
        queryParams.put("deleted", String.valueOf(this.deleted));
        queryParams.put("matchID", this.matchID);
        queryParams.put("partyID", this.partyID);
        queryParams.put("userID", this.userID);
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
        result.put("channel","channel");
        result.put("deleted","deleted");
        result.put("matchID","matchID");
        result.put("partyID","partyID");
        result.put("userID","userID");
        result.put("limit","limit");
        result.put("offset","offset");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",





            "limit",
            "offset"
        );
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.limit == null) {
            return false;
        }
        if(this.offset == null) {
            return false;
        }
        return true;
    }

    @Override
    public ServiceGetSessionHistorySearchResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ServiceGetSessionHistorySearchResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
