package net.accelbyte.sdk.api.qosm.operations.server;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.qosm.models.*;
import net.accelbyte.sdk.api.qosm.models.ModelsHeartbeatRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class Heartbeat extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/qosm/servers/heartbeat";

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
    private ModelsHeartbeatRequest body;

    /**
    * @param body required
    */
    public Heartbeat(
            ModelsHeartbeatRequest body
    )
    {
        this.body = body;
    }

    public Heartbeat(){
    }

    public Heartbeat createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }



    @Override
    @JsonIgnore
    public ModelsHeartbeatRequest getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }


    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
        );
    }

    @Override
    public boolean isValid() {
        return true;
    }

    @Override
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code != 204){
            throw new ResponseException(code, json);
        }
    }
}