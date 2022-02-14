package net.accelbyte.sdk.api.platform.operations.payment_station;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * getPaymentPublicConfig
 *
 * Get payment provider public config, at current only Strip provide public
 * config.
 * Other detail info:
 * 
 *   * Returns : Public config
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class GetPaymentPublicConfig extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/public/namespaces/{namespace}/payment/publicconfig";

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
    private Boolean sandbox;
    private String paymentProvider;
    private String region;

    /**
    * @param namespace required
    * @param paymentProvider required
    * @param region required
    */
    public GetPaymentPublicConfig(
            String namespace,
            Boolean sandbox,
            String paymentProvider,
            String region
    )
    {
        this.namespace = namespace;
        this.sandbox = sandbox;
        this.paymentProvider = paymentProvider;
        this.region = region;
    }

    @JsonIgnore
    public GetPaymentPublicConfig createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("sandbox", this.sandbox == null ? null : Arrays.asList(String.valueOf(this.sandbox)));
        queryParams.put("paymentProvider", this.paymentProvider == null ? null : Arrays.asList(this.paymentProvider));
        queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
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
        result.put("namespace","namespace");
        result.put("sandbox","sandbox");
        result.put("paymentProvider","paymentProvider");
        result.put("region","region");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",

            "paymentProvider",
            "region"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.paymentProvider == null) {
            return false;
        }
        if(this.region == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public Map<String, ?> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<Map<String, ?>>() {});
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("sandbox", "None");
        result.put("paymentProvider", "None");
        result.put("region", "None");
        return result;
    }
}