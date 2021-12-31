package net.accelbyte.sdk.api.platform.operations.payment_config;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.PaymentProviderConfigPagingSlicedResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class QueryPaymentProviderConfig extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/admin/payment/config/provider";

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
    private Integer limit;
    private String namespace;
    private Integer offset;
    private String region;

    /**
    */
    public QueryPaymentProviderConfig(
            Integer limit,
            String namespace,
            Integer offset,
            String region
    )
    {
        this.limit = limit;
        this.namespace = namespace;
        this.offset = offset;
        this.region = region;
    }

    public QueryPaymentProviderConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }


    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("limit", String.valueOf(this.limit));
        queryParams.put("namespace", this.namespace);
        queryParams.put("offset", String.valueOf(this.offset));
        queryParams.put("region", this.region);
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("limit","limit");
        result.put("namespace","namespace");
        result.put("offset","offset");
        result.put("region","region");
        return result;
    }


    @Override
    public PaymentProviderConfigPagingSlicedResult parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new PaymentProviderConfigPagingSlicedResult().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
