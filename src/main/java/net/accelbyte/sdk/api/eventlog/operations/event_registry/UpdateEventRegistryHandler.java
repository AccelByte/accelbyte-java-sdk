package net.accelbyte.sdk.api.eventlog.operations.event_registry;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.models.ModelsEventRegistry;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * UpdateEventRegistryHandler
 *
 * Required permission `ADMIN:NAMESPACE:{namespace}:EVENT [UPDATE]`and scope
 * `analytics`
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class UpdateEventRegistryHandler extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/event/registry/eventIds/{eventId}";

    @JsonIgnore
    private String method = "POST";

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
    private String eventId;
    private ModelsEventRegistry body;

    /**
    * @param eventId required
    * @param body required
    */
    public UpdateEventRegistryHandler(
            String eventId,
            ModelsEventRegistry body
    )
    {
        this.eventId = eventId;
        this.body = body;
    }

    @JsonIgnore
    public UpdateEventRegistryHandler createFromJson(String json) throws JsonProcessingException {
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
        if (this.eventId != null){
            pathParams.put("eventId", this.eventId);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public ModelsEventRegistry getBodyParams(){
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
        result.put("eventId","eventId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "eventId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.eventId == null) {
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