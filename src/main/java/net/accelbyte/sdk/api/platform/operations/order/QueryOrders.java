package net.accelbyte.sdk.api.platform.operations.order;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.OrderPagingResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class QueryOrders extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/admin/namespaces/{namespace}/orders";

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
    private String endTime;
    private Integer limit;
    private Integer offset;
    private List<String> orderNos;
    private String sortBy;
    private String startTime;
    private String status;
    private Boolean withTotal;

    /**
    * @param namespace required
    */
    public QueryOrders(
            String namespace,
            String endTime,
            Integer limit,
            Integer offset,
            List<String> orderNos,
            String sortBy,
            String startTime,
            String status,
            Boolean withTotal
    )
    {
        this.namespace = namespace;
        this.endTime = endTime;
        this.limit = limit;
        this.offset = offset;
        this.orderNos = orderNos;
        this.sortBy = sortBy;
        this.startTime = startTime;
        this.status = status;
        this.withTotal = withTotal;
    }

    public QueryOrders createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("endTime", this.endTime);
        queryParams.put("limit", String.valueOf(this.limit));
        queryParams.put("offset", String.valueOf(this.offset));
        queryParams.put("orderNos", String.valueOf(this.orderNos));
        queryParams.put("sortBy", this.sortBy);
        queryParams.put("startTime", this.startTime);
        queryParams.put("status", this.status);
        queryParams.put("withTotal", String.valueOf(this.withTotal));
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
        result.put("endTime","endTime");
        result.put("limit","limit");
        result.put("offset","offset");
        result.put("orderNos","orderNos");
        result.put("sortBy","sortBy");
        result.put("startTime","startTime");
        result.put("status","status");
        result.put("withTotal","withTotal");
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
    public OrderPagingResult parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OrderPagingResult().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
