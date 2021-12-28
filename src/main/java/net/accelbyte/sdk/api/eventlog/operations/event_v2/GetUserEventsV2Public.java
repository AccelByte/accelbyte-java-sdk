package net.accelbyte.sdk.api.eventlog.operations.event_v2;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.models.ModelsEventResponseV2;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class GetUserEventsV2Public extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/event/v2/public/namespaces/{namespace}/users/{userId}/event";

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
    private String userId;
    private String endDate;
    private String eventName;
    private Float offset;
    private Float pageSize;
    private String startDate;

    /**
    * @param namespace required
    * @param userId required
    */
    public GetUserEventsV2Public(
            String namespace,
            String userId,
            String endDate,
            String eventName,
            Float offset,
            Float pageSize,
            String startDate
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.endDate = endDate;
        this.eventName = eventName;
        this.offset = offset;
        this.pageSize = pageSize;
        this.startDate = startDate;
    }

    public GetUserEventsV2Public(){
    }

    public GetUserEventsV2Public createFromJson(String json) throws JsonProcessingException {
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
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("endDate", this.endDate);
        queryParams.put("eventName", this.eventName);
        queryParams.put("offset", String.valueOf(this.offset));
        queryParams.put("pageSize", String.valueOf(this.pageSize));
        queryParams.put("startDate", this.startDate);
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
        result.put("userId","userId");
        result.put("endDate","endDate");
        result.put("eventName","eventName");
        result.put("offset","offset");
        result.put("pageSize","pageSize");
        result.put("startDate","startDate");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "userId"
        );
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsEventResponseV2 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsEventResponseV2().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
