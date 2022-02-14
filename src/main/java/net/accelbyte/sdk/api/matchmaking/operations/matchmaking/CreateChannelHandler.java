package net.accelbyte.sdk.api.matchmaking.operations.matchmaking;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.models.ModelsCreateChannelResponse;
import net.accelbyte.sdk.api.matchmaking.models.ModelsChannelRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * CreateChannelHandler
 *
 * Required Permission: NAMESPACE:{namespace}:MATCHMAKING:CHANNEL [CREATE]
 * Required Scope: social Creates a new matchmaking channel. Matchmaking channels
 * is a list of pool name that is eligible for matchmaking processes. GameMode
 * isolates each matchmaking pools. If match timeout is set to 0, by default,
 * incoming matchmaking requests will be timed out after 1 hour. If max worker
 * delay is set to 0, by default, it will wait for at max ~8 seconds during low
 * volume. Rule Set Matching Rule used to classify the player. Player that has
 * matched criteria will be grouped together within an ally. Valid value for
 * criteria is "distance"
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class CreateChannelHandler extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/matchmaking/namespaces/{namespace}/channels";

    @JsonIgnore
    private String method = "POST";

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
    private ModelsChannelRequest body;

    /**
    * @param namespace required
    * @param body required
    */
    public CreateChannelHandler(
            String namespace,
            ModelsChannelRequest body
    )
    {
        this.namespace = namespace;
        this.body = body;
    }

    @JsonIgnore
    public CreateChannelHandler createFromJson(String json) throws JsonProcessingException {
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
    public ModelsChannelRequest getBodyParams(){
        return this.body;
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
    public ModelsCreateChannelResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelsCreateChannelResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}