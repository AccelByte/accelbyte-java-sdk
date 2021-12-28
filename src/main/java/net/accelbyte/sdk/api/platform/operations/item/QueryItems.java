package net.accelbyte.sdk.api.platform.operations.item;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.FullItemPagingSlicedResult;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class QueryItems extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/admin/namespaces/{namespace}/items/byCriteria";

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
    private String appType;
    private String availableDate;
    private String baseAppId;
    private String categoryPath;
    private String features;
    private String itemType;
    private Integer limit;
    private Integer offset;
    private String region;
    private String sortBy;
    private String storeId;
    private String tags;
    private String targetNamespace;

    /**
    * @param namespace required
    */
    public QueryItems(
            String namespace,
            Boolean activeOnly,
            String appType,
            String availableDate,
            String baseAppId,
            String categoryPath,
            String features,
            String itemType,
            Integer limit,
            Integer offset,
            String region,
            String sortBy,
            String storeId,
            String tags,
            String targetNamespace
    )
    {
        this.namespace = namespace;
        this.activeOnly = activeOnly;
        this.appType = appType;
        this.availableDate = availableDate;
        this.baseAppId = baseAppId;
        this.categoryPath = categoryPath;
        this.features = features;
        this.itemType = itemType;
        this.limit = limit;
        this.offset = offset;
        this.region = region;
        this.sortBy = sortBy;
        this.storeId = storeId;
        this.tags = tags;
        this.targetNamespace = targetNamespace;
    }

    public QueryItems(){
    }

    public QueryItems createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("activeOnly", String.valueOf(this.activeOnly));
        queryParams.put("appType", this.appType);
        queryParams.put("availableDate", this.availableDate);
        queryParams.put("baseAppId", this.baseAppId);
        queryParams.put("categoryPath", this.categoryPath);
        queryParams.put("features", this.features);
        queryParams.put("itemType", this.itemType);
        queryParams.put("limit", String.valueOf(this.limit));
        queryParams.put("offset", String.valueOf(this.offset));
        queryParams.put("region", this.region);
        queryParams.put("sortBy", this.sortBy);
        queryParams.put("storeId", this.storeId);
        queryParams.put("tags", this.tags);
        queryParams.put("targetNamespace", this.targetNamespace);
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
        result.put("activeOnly","activeOnly");
        result.put("appType","appType");
        result.put("availableDate","availableDate");
        result.put("baseAppId","baseAppId");
        result.put("categoryPath","categoryPath");
        result.put("features","features");
        result.put("itemType","itemType");
        result.put("limit","limit");
        result.put("offset","offset");
        result.put("region","region");
        result.put("sortBy","sortBy");
        result.put("storeId","storeId");
        result.put("tags","tags");
        result.put("targetNamespace","targetNamespace");
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
    public FullItemPagingSlicedResult parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new FullItemPagingSlicedResult().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
