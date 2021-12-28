package net.accelbyte.sdk.api.lobby.operations.notification;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.models.ModelTemplateLocalizationResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class GetSlugTemplate extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/notification/namespaces/{namespace}/templates/{templateSlug}";

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
    private String templateSlug;
    private String after;
    private String before;
    private Integer limit;

    /**
    * @param namespace required
    * @param templateSlug required
    */
    public GetSlugTemplate(
            String namespace,
            String templateSlug,
            String after,
            String before,
            Integer limit
    )
    {
        this.namespace = namespace;
        this.templateSlug = templateSlug;
        this.after = after;
        this.before = before;
        this.limit = limit;
    }

    public GetSlugTemplate(){
    }

    public GetSlugTemplate createFromJson(String json) throws JsonProcessingException {
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
        if (this.templateSlug != null){
            pathParams.put("templateSlug", this.templateSlug);
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
        result.put("templateSlug","templateSlug");
        result.put("after","after");
        result.put("before","before");
        result.put("limit","limit");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "templateSlug"
        );
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.templateSlug == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelTemplateLocalizationResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelTemplateLocalizationResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
