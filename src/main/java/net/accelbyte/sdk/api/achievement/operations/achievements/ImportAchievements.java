package net.accelbyte.sdk.api.achievement.operations.achievements;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.achievement.models.*;
import net.accelbyte.sdk.api.achievement.models.ServiceImportConfigResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * ImportAchievements
 *
 * Required permission ADMIN:NAMESPACE:{namespace}:ACHIEVEMENT [UPDATE] Required
 * Scope: social Import channels configuration from file. It will merge with
 * existing channels. Available import strategy: - leaveOut: if channel with
 * same key exist, the existing will be used and imported one will be ignored
 * (default) - replace: if channel with same key exist, the imported channel
 * will be used and existing one will be removed
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class ImportAchievements extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/achievement/v1/admin/namespaces/{namespace}/achievements/import";

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
    private InputStream file;
    private String strategy;

    /**
    * @param namespace required
    */
    public ImportAchievements(
            String namespace,
            InputStream file,
            String strategy
    )
    {
        this.namespace = namespace;
        this.file = file;
        this.strategy = strategy;
    }

    @JsonIgnore
    public ImportAchievements createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, Object> getFormDataParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.file != null) {
            formDataParams.put("file", this.file);
        }
        if (this.strategy != null) {
            formDataParams.put("strategy", this.strategy);
        }
        return formDataParams;
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
        result.put("file","file");
        result.put("strategy","strategy");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ServiceImportConfigResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ServiceImportConfigResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}