package net.accelbyte.sdk.api.platform.operations.payment;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class ListExtOrderNoByExtTxId extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/admin/namespaces/{namespace}/payment/orders/byExtTxId";

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
    private String extTxId;

    /**
    * @param namespace required
    * @param extTxId required
    */
    public ListExtOrderNoByExtTxId(
            String namespace,
            String extTxId
    )
    {
        this.namespace = namespace;
        this.extTxId = extTxId;
    }

    public ListExtOrderNoByExtTxId createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("extTxId", this.extTxId);
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
        result.put("extTxId","extTxId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "extTxId"
        );
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.extTxId == null) {
            return false;
        }
        return true;
    }

    @Override
    public List<String> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<String>>() {});
        }
        throw new ResponseException(code, json);
    }
}
