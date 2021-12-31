package net.accelbyte.sdk.api.sessionbrowser.operations.session;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsSessionQueryResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class QuerySession extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/sessionbrowser/namespaces/{namespace}/gamesession";

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
    private String gameMode;
    private String gameVersion;
    private String joinable;
    private String limit;
    private String matchExist;
    private String matchId;
    private String offset;
    private String serverStatus;
    private String userId;
    private String sessionType;

    /**
    * @param namespace required
    * @param sessionType required
    */
    public QuerySession(
            String namespace,
            String gameMode,
            String gameVersion,
            String joinable,
            String limit,
            String matchExist,
            String matchId,
            String offset,
            String serverStatus,
            String userId,
            String sessionType
    )
    {
        this.namespace = namespace;
        this.gameMode = gameMode;
        this.gameVersion = gameVersion;
        this.joinable = joinable;
        this.limit = limit;
        this.matchExist = matchExist;
        this.matchId = matchId;
        this.offset = offset;
        this.serverStatus = serverStatus;
        this.userId = userId;
        this.sessionType = sessionType;
    }

    public QuerySession createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("game_mode", this.gameMode);
        queryParams.put("game_version", this.gameVersion);
        queryParams.put("joinable", this.joinable);
        queryParams.put("limit", this.limit);
        queryParams.put("match_exist", this.matchExist);
        queryParams.put("match_id", this.matchId);
        queryParams.put("offset", this.offset);
        queryParams.put("server_status", this.serverStatus);
        queryParams.put("user_id", this.userId);
        queryParams.put("session_type", this.sessionType);
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
        result.put("game_mode","gameMode");
        result.put("game_version","gameVersion");
        result.put("joinable","joinable");
        result.put("limit","limit");
        result.put("match_exist","matchExist");
        result.put("match_id","matchId");
        result.put("offset","offset");
        result.put("server_status","serverStatus");
        result.put("user_id","userId");
        result.put("session_type","sessionType");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",









            "sessionType"
        );
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.sessionType == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsSessionQueryResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsSessionQueryResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
