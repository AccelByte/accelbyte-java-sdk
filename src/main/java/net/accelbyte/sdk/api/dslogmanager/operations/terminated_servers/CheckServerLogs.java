package net.accelbyte.sdk.api.dslogmanager.operations.terminated_servers;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dslogmanager.models.*;
import net.accelbyte.sdk.api.dslogmanager.models.ModelsLogFileStatus;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * checkServerLogs
 *
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSLM:LOG [READ] Required
 * scope: social This endpoint will check log file existence before download
 * file.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class CheckServerLogs extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/dslogmanager/namespaces/{namespace}/servers/{podName}/logs/exists";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json","text/x-log");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private String namespace;
    private String podName;

    /**
    * @param namespace required
    * @param podName required
    */
    public CheckServerLogs(
            String namespace,
            String podName
    )
    {
        this.namespace = namespace;
        this.podName = podName;
    }

    @JsonIgnore
    public CheckServerLogs createFromJson(String json) throws JsonProcessingException {
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
        if (this.podName != null){
            pathParams.put("podName", this.podName);
        }
        return pathParams;
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
        result.put("podName","podName");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "podName"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.podName == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ModelsLogFileStatus parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsLogFileStatus().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}