package net.accelbyte.sdk.api.dslogmanager.operations.terminated_servers;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dslogmanager.models.*;
import net.accelbyte.sdk.api.dslogmanager.models.ModelsListTerminatedServersResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class ListTerminatedServers extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/dslogmanager/namespaces/{namespace}/servers/search";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json","text/x-log");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private String namespace;
    private String deployment;
    private String endDate;
    private String gameMode;
    private Integer limit;
    private String next;
    private String partyId;
    private String podName;
    private String previous;
    private String provider;
    private String region;
    private String sessionId;
    private String startDate;
    private String userId;

    /**
    * @param namespace required
    */
    public ListTerminatedServers(
            String namespace,
            String deployment,
            String endDate,
            String gameMode,
            Integer limit,
            String next,
            String partyId,
            String podName,
            String previous,
            String provider,
            String region,
            String sessionId,
            String startDate,
            String userId
    )
    {
        this.namespace = namespace;
        this.deployment = deployment;
        this.endDate = endDate;
        this.gameMode = gameMode;
        this.limit = limit;
        this.next = next;
        this.partyId = partyId;
        this.podName = podName;
        this.previous = previous;
        this.provider = provider;
        this.region = region;
        this.sessionId = sessionId;
        this.startDate = startDate;
        this.userId = userId;
    }

    @JsonIgnore
    public ListTerminatedServers createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("deployment", this.deployment);
        queryParams.put("end_date", this.endDate);
        queryParams.put("game_mode", this.gameMode);
        queryParams.put("limit", this.limit == null ? null : String.valueOf(this.limit));
        queryParams.put("next", this.next);
        queryParams.put("party_id", this.partyId);
        queryParams.put("pod_name", this.podName);
        queryParams.put("previous", this.previous);
        queryParams.put("provider", this.provider);
        queryParams.put("region", this.region);
        queryParams.put("session_id", this.sessionId);
        queryParams.put("start_date", this.startDate);
        queryParams.put("user_id", this.userId);
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("deployment","deployment");
        result.put("end_date","endDate");
        result.put("game_mode","gameMode");
        result.put("limit","limit");
        result.put("next","next");
        result.put("party_id","partyId");
        result.put("pod_name","podName");
        result.put("previous","previous");
        result.put("provider","provider");
        result.put("region","region");
        result.put("session_id","sessionId");
        result.put("start_date","startDate");
        result.put("user_id","userId");
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
    public ModelsListTerminatedServersResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsListTerminatedServersResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
