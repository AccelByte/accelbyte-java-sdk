package net.accelbyte.sdk.api.platform.operations.item;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.PopulatedItemInfo;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class GetLocaleItemBySku extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/admin/namespaces/{namespace}/items/bySku/locale";

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
    private Boolean activeOnly;
    private String language;
    private Boolean populateBundle;
    private String region;
    private String storeId;
    private String sku;

    /**
    * @param namespace required
    * @param sku required
    */
    public GetLocaleItemBySku(
            String namespace,
            Boolean activeOnly,
            String language,
            Boolean populateBundle,
            String region,
            String storeId,
            String sku
    )
    {
        this.namespace = namespace;
        this.activeOnly = activeOnly;
        this.language = language;
        this.populateBundle = populateBundle;
        this.region = region;
        this.storeId = storeId;
        this.sku = sku;
    }

    @JsonIgnore
    public GetLocaleItemBySku createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("activeOnly", this.activeOnly == null ? null : Arrays.asList(String.valueOf(this.activeOnly)));
        queryParams.put("language", this.language == null ? null : Arrays.asList(this.language));
        queryParams.put("populateBundle", this.populateBundle == null ? null : Arrays.asList(String.valueOf(this.populateBundle)));
        queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
        queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
        queryParams.put("sku", this.sku == null ? null : Arrays.asList(this.sku));
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
        result.put("activeOnly","activeOnly");
        result.put("language","language");
        result.put("populateBundle","populateBundle");
        result.put("region","region");
        result.put("storeId","storeId");
        result.put("sku","sku");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",





            "sku"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.sku == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public PopulatedItemInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new PopulatedItemInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("activeOnly", "None");
        result.put("language", "None");
        result.put("populateBundle", "None");
        result.put("region", "None");
        result.put("storeId", "None");
        result.put("sku", "None");
        return result;
    }
}