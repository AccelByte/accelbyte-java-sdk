package net.accelbyte.sdk.api.gdpr.operations.data_deletion;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.models.ModelsListDeletionDataResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class AdminGetListDeletionDataRequest extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/gdpr/admin/namespaces/{namespace}/deletions";

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
    private String after;
    private String before;
    private Integer limit;
    private Integer offset;
    private String requestDate;

    /**
    * @param namespace required
    */
    public AdminGetListDeletionDataRequest(
            String namespace,
            String after,
            String before,
            Integer limit,
            Integer offset,
            String requestDate
    )
    {
        this.namespace = namespace;
        this.after = after;
        this.before = before;
        this.limit = limit;
        this.offset = offset;
        this.requestDate = requestDate;
    }

    public AdminGetListDeletionDataRequest(){
    }

    public AdminGetListDeletionDataRequest createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("after", this.after);
        queryParams.put("before", this.before);
        queryParams.put("limit", String.valueOf(this.limit));
        queryParams.put("offset", String.valueOf(this.offset));
        queryParams.put("requestDate", this.requestDate);
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
        result.put("after","after");
        result.put("before","before");
        result.put("limit","limit");
        result.put("offset","offset");
        result.put("requestDate","requestDate");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace"
        );
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsListDeletionDataResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsListDeletionDataResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
