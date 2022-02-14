package net.accelbyte.sdk.api.platform.operations.item;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.ItemId;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * getItemIdBySku
 *
 *  [SERVICE COMMUNICATION ONLY] This API is used to get the itemId by sku.
 * 
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:ITEM", action=2 (READ)
 *   *  Returns : the itemId with sku
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class GetItemIdBySku extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/admin/namespaces/{namespace}/items/itemId/bySku";

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
    private String storeId;
    private String sku;

    /**
    * @param namespace required
    * @param sku required
    */
    public GetItemIdBySku(
            String namespace,
            Boolean activeOnly,
            String storeId,
            String sku
    )
    {
        this.namespace = namespace;
        this.activeOnly = activeOnly;
        this.storeId = storeId;
        this.sku = sku;
    }

    @JsonIgnore
    public GetItemIdBySku createFromJson(String json) throws JsonProcessingException {
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
    public ItemId parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ItemId().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("activeOnly", "None");
        result.put("storeId", "None");
        result.put("sku", "None");
        return result;
    }
}