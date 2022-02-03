package net.accelbyte.sdk.api.gdpr.operations.data_retrieval;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.models.ModelsUserDataURL;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class PublicGeneratePersonalDataURL extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/gdpr/public/namespaces/{namespace}/users/{userId}/requests/{requestDate}/generate";

    @JsonIgnore
    private String method = "POST";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");

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
    private String requestDate;
    private String userId;
    private String password;

    /**
    * @param namespace required
    * @param requestDate required
    * @param userId required
    * @param password required
    */
    public PublicGeneratePersonalDataURL(
            String namespace,
            String requestDate,
            String userId,
            String password
    )
    {
        this.namespace = namespace;
        this.requestDate = requestDate;
        this.userId = userId;
        this.password = password;
    }

    @JsonIgnore
    public PublicGeneratePersonalDataURL createFromJson(String json) throws JsonProcessingException {
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
        if (this.requestDate != null){
            pathParams.put("requestDate", this.requestDate);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }



    @Override
    @JsonIgnore
    public Map<String, Object> getFormDataParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        formDataParams.put("password", this.password);
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
        result.put("requestDate","requestDate");
        result.put("userId","userId");
        result.put("password","password");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "requestDate",
            "userId",
            "password"        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.requestDate == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        if(this.password == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ModelsUserDataURL parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsUserDataURL().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}