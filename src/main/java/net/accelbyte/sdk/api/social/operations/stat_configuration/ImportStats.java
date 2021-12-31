package net.accelbyte.sdk.api.social.operations.stat_configuration;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.models.StatImportInfo;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class ImportStats extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/social/v1/admin/namespaces/{namespace}/stats/import";

    @JsonIgnore
    private String method = "POST";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("multipart/form-data");

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
    private Boolean replaceExisting;
    private InputStream file;

    /**
    * @param namespace required
    */
    public ImportStats(
            String namespace,
            Boolean replaceExisting,
            InputStream file
    )
    {
        this.namespace = namespace;
        this.replaceExisting = replaceExisting;
        this.file = file;
    }

    public ImportStats createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("replaceExisting", String.valueOf(this.replaceExisting));
        return queryParams;
    }


    @Override
    @JsonIgnore
    public Map<String, String> getFormDataParams(){
        Map<String, String> formDataParams = new HashMap<>();
        formDataParams.put("file", String.valueOf(this.file));
        return formDataParams;
    }

    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("replaceExisting","replaceExisting");
        result.put("file","file");
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
    public StatImportInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new StatImportInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
