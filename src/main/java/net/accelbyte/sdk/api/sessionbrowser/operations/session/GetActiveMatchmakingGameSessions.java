package net.accelbyte.sdk.api.sessionbrowser.operations.session;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsActiveMatchmakingGameResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * GetActiveMatchmakingGameSessions
 *
 * Required permission: ADMIN:NAMESPACE:{namespace}:SESSIONBROWSER:SESSION [READ]
 * Required scope: social
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class GetActiveMatchmakingGameSessions extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/sessionbrowser/admin/namespaces/{namespace}/gamesession/active/matchmaking-game";

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
    private String matchId;
    private String serverRegion;
    private String sessionId;

    /**
    * @param namespace required
    */
    public GetActiveMatchmakingGameSessions(
            String namespace,
            String matchId,
            String serverRegion,
            String sessionId
    )
    {
        this.namespace = namespace;
        this.matchId = matchId;
        this.serverRegion = serverRegion;
        this.sessionId = sessionId;
    }

    @JsonIgnore
    public GetActiveMatchmakingGameSessions createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("match_id", this.matchId == null ? null : Arrays.asList(this.matchId));
        queryParams.put("server_region", this.serverRegion == null ? null : Arrays.asList(this.serverRegion));
        queryParams.put("session_id", this.sessionId == null ? null : Arrays.asList(this.sessionId));
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
        result.put("match_id","matchId");
        result.put("server_region","serverRegion");
        result.put("session_id","sessionId");
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
    public ModelsActiveMatchmakingGameResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsActiveMatchmakingGameResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("match_id", "None");
        result.put("server_region", "None");
        result.put("session_id", "None");
        return result;
    }
}