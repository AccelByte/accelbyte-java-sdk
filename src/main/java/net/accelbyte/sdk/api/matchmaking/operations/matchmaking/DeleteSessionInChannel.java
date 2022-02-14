package net.accelbyte.sdk.api.matchmaking.operations.matchmaking;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * DeleteSessionInChannel
 *
 * Required Permission: ADMIN:NAMESPACE:{namespace}:MATCHMAKING:CHANNEL [Delete]
 * Required Scope: social Delete a session in a channel.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class DeleteSessionInChannel extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/matchmaking/v1/admin/namespaces/{namespace}/channels/{channelName}/sessions/{matchID}";

    @JsonIgnore
    private String method = "DELETE";

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
    private String channelName;
    private String matchID;
    private String namespace;

    /**
    * @param channelName required
    * @param matchID required
    * @param namespace required
    */
    public DeleteSessionInChannel(
            String channelName,
            String matchID,
            String namespace
    )
    {
        this.channelName = channelName;
        this.matchID = matchID;
        this.namespace = namespace;
    }

    @JsonIgnore
    public DeleteSessionInChannel createFromJson(String json) throws JsonProcessingException {
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
        if (this.channelName != null){
            pathParams.put("channelName", this.channelName);
        }
        if (this.matchID != null){
            pathParams.put("matchID", this.matchID);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }




    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("channelName","channelName");
        result.put("matchID","matchID");
        result.put("namespace","namespace");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "channelName",
            "matchID",
            "namespace"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.channelName == null) {
            return false;
        }
        if(this.matchID == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}