package net.accelbyte.sdk.api.platform.operations.item;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
import java.util.*;

@Getter
@Setter
public class GetLocaleItem extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/admin/namespaces/{namespace}/items/{itemId}/locale";

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
    private String itemId;
    private String namespace;
    private Boolean activeOnly;
    private String language;
    private Boolean populateBundle;
    private String region;
    private String storeId;

    /**
    * @param itemId required
    * @param namespace required
    */
    public GetLocaleItem(
            String itemId,
            String namespace,
            Boolean activeOnly,
            String language,
            Boolean populateBundle,
            String region,
            String storeId
    )
    {
        this.itemId = itemId;
        this.namespace = namespace;
        this.activeOnly = activeOnly;
        this.language = language;
        this.populateBundle = populateBundle;
        this.region = region;
        this.storeId = storeId;
    }

    public GetLocaleItem createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.itemId != null){
            pathParams.put("itemId", this.itemId);
        }
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
        queryParams.put("language", this.language);
        queryParams.put("populateBundle", String.valueOf(this.populateBundle));
        queryParams.put("region", this.region);
        queryParams.put("storeId", this.storeId);
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("itemId","itemId");
        result.put("namespace","namespace");
        result.put("activeOnly","activeOnly");
        result.put("language","language");
        result.put("populateBundle","populateBundle");
        result.put("region","region");
        result.put("storeId","storeId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "itemId",
            "namespace"
        );
    }

    @Override
    public boolean isValid() {
        if(this.itemId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public PopulatedItemInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new PopulatedItemInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
