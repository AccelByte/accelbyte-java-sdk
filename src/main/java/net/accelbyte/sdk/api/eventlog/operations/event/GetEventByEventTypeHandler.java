package net.accelbyte.sdk.api.eventlog.operations.event;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.models.ModelsEventResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class GetEventByEventTypeHandler extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/event/namespaces/{namespace}/eventType/{eventType}";

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
    private Float eventType;
    private String namespace;
    private Float offset;
    private String endDate;
    private Float pageSize;
    private String startDate;

    /**
    * @param eventType required
    * @param namespace required
    * @param endDate required
    * @param pageSize required
    * @param startDate required
    */
    public GetEventByEventTypeHandler(
            Float eventType,
            String namespace,
            Float offset,
            String endDate,
            Float pageSize,
            String startDate
    )
    {
        this.eventType = eventType;
        this.namespace = namespace;
        this.offset = offset;
        this.endDate = endDate;
        this.pageSize = pageSize;
        this.startDate = startDate;
    }

    @JsonIgnore
    public GetEventByEventTypeHandler createFromJson(String json) throws JsonProcessingException {
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
        if (this.eventType != null){
            pathParams.put("eventType", this.eventType == null ? null : String.valueOf(this.eventType));
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("offset", this.offset == null ? null : String.valueOf(this.offset));
        queryParams.put("endDate", this.endDate);
        queryParams.put("pageSize", this.pageSize == null ? null : String.valueOf(this.pageSize));
        queryParams.put("startDate", this.startDate);
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
        result.put("eventType","eventType");
        result.put("namespace","namespace");
        result.put("offset","offset");
        result.put("endDate","endDate");
        result.put("pageSize","pageSize");
        result.put("startDate","startDate");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "eventType",
            "namespace",

            "endDate",
            "pageSize",
            "startDate"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.eventType == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.endDate == null) {
            return false;
        }
        if(this.pageSize == null) {
            return false;
        }
        if(this.startDate == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ModelsEventResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsEventResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
