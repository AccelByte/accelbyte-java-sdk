package net.accelbyte.sdk.api.iam.operations.o_auth;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class Authorization extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/oauth/authorize";

    @JsonIgnore
    private String method = "POST";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = "PLACEHOLDER";

    /**
     * fields as input parameter
     */
    private String login;
    private String password;
    private String scope;
    private String state;
    private String clientId;
    private String redirectUri;
    private String responseType;

    /**
    * @param clientId required
    * @param redirectUri required
    * @param responseType required
    */
    public Authorization(
            String login,
            String password,
            String scope,
            String state,
            String clientId,
            String redirectUri,
            String responseType
    )
    {
        this.login = login;
        this.password = password;
        this.scope = scope;
        this.state = state;
        this.clientId = clientId;
        this.redirectUri = redirectUri;
        this.responseType = responseType;
    }

    @JsonIgnore
    public Authorization createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }




    @Override
    @JsonIgnore
    public Map<String, Object> getFormDataParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.login != null) {
            formDataParams.put("login", this.login);
        }
        if (this.password != null) {
            formDataParams.put("password", this.password);
        }
        if (this.scope != null) {
            formDataParams.put("scope", this.scope);
        }
        if (this.state != null) {
            formDataParams.put("state", this.state);
        }
        if (this.clientId != null) {
            formDataParams.put("client_id", this.clientId);
        }
        if (this.redirectUri != null) {
            formDataParams.put("redirect_uri", this.redirectUri);
        }
        if (this.responseType != null) {
            formDataParams.put("response_type", this.responseType);
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
        result.put("login","login");
        result.put("password","password");
        result.put("scope","scope");
        result.put("state","state");
        result.put("client_id","clientId");
        result.put("redirect_uri","redirectUri");
        result.put("response_type","responseType");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "clientId",            "redirectUri",            "responseType"        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.clientId == null) {
            return false;
        }
        if(this.redirectUri == null) {
            return false;
        }
        if(this.responseType == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public String parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code != 302){
            throw new ResponseException(code, json);
        }
        return json;
    }

}