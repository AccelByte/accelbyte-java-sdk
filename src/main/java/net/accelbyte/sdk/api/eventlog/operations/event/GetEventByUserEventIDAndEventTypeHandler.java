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
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * GetEventByUserEventIDAndEventTypeHandler
 *
 * Required permission `NAMESPACE:{namespace}:EVENT [UPDATE]`and scope
 * `analytics`
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class GetEventByUserEventIDAndEventTypeHandler extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/event/namespaces/{namespace}/users/{userId}/eventType/{eventType}/eventId/{eventId}";

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
    private Float eventId;
    private Float eventType;
    private String namespace;
    private String userId;
    private Float offset;
    private String endDate;
    private Float pageSize;
    private String startDate;

    /**
    * @param eventId required
    * @param eventType required
    * @param namespace required
    * @param userId required
    * @param endDate required
    * @param pageSize required
    * @param startDate required
    */
    public GetEventByUserEventIDAndEventTypeHandler(
            Float eventId,
            Float eventType,
            String namespace,
            String userId,
            Float offset,
            String endDate,
            Float pageSize,
            String startDate
    )
    {
        this.eventId = eventId;
        this.eventType = eventType;
        this.namespace = namespace;
        this.userId = userId;
        this.offset = offset;
        this.endDate = endDate;
        this.pageSize = pageSize;
        this.startDate = startDate;
    }

    @JsonIgnore
    public GetEventByUserEventIDAndEventTypeHandler createFromJson(String json) throws JsonProcessingException {
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
            pathParams.put("eventId", this.eventId == null ? null : String.valueOf(this.eventId));
        }
        if (this.eventType != null){
            pathParams.put("eventType", this.eventType == null ? null : String.valueOf(this.eventType));
        }
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
        queryParams.put("pageSize", this.pageSize == null ? null : Arrays.asList(String.valueOf(this.pageSize)));
        queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
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
        result.put("eventId","eventId");
        result.put("eventType","eventType");
        result.put("namespace","namespace");
        result.put("userId","userId");
        result.put("offset","offset");
        result.put("endDate","endDate");
        result.put("pageSize","pageSize");
        result.put("startDate","startDate");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "eventId",
            "eventType",
            "namespace",
            "userId",

            "endDate",
            "pageSize",
            "startDate"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.eventId == null) {
            return false;
        }
        if(this.eventType == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
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

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("offset", "None");
        result.put("endDate", "None");
        result.put("pageSize", "None");
        result.put("startDate", "None");
        return result;
    }
}