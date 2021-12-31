package net.accelbyte.sdk.api.platform.operations.category;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.FullCategoryInfo;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class DeleteCategory extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/admin/namespaces/{namespace}/categories/{categoryPath}";

    @JsonIgnore
    private String method = "DELETE";

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
    private String categoryPath;
    private String namespace;
    private String storeId;

    /**
    * @param categoryPath required
    * @param namespace required
    * @param storeId required
    */
    public DeleteCategory(
            String categoryPath,
            String namespace,
            String storeId
    )
    {
        this.categoryPath = categoryPath;
        this.namespace = namespace;
        this.storeId = storeId;
    }

    public DeleteCategory createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.categoryPath != null){
            pathParams.put("categoryPath", this.categoryPath);
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
        result.put("categoryPath","categoryPath");
        result.put("namespace","namespace");
        result.put("storeId","storeId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "categoryPath",
            "namespace",
            "storeId"
        );
    }

    @Override
    public boolean isValid() {
        if(this.categoryPath == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.storeId == null) {
            return false;
        }
        return true;
    }

    @Override
    public FullCategoryInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new FullCategoryInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
