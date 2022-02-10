package net.accelbyte.sdk.api.iam.operations.o_auth;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class TokenGrant extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/oauth/token";

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
    private String code;
    private Boolean extendExp;
    private String namespace;
    private String password;
    private String redirectUri;
    private String refreshToken;
    private String username;
    private String grantType;

    /**
    * @param grantType required
    */
    public TokenGrant(
            String code,
            Boolean extendExp,
            String namespace,
            String password,
            String redirectUri,
            String refreshToken,
            String username,
            String grantType
    )
    {
        this.code = code;
        this.extendExp = extendExp;
        this.namespace = namespace;
        this.password = password;
        this.redirectUri = redirectUri;
        this.refreshToken = refreshToken;
        this.username = username;
        this.grantType = grantType;
    }

    @JsonIgnore
    public TokenGrant createFromJson(String json) throws JsonProcessingException {
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
        if (this.code != null) {
            formDataParams.put("code", this.code);
        }
        if (this.extendExp != null) {
            formDataParams.put("extend_exp", this.extendExp == null ? null : String.valueOf(this.extendExp));
        }
        if (this.namespace != null) {
            formDataParams.put("namespace", this.namespace);
        }
        if (this.password != null) {
            formDataParams.put("password", this.password);
        }
        if (this.redirectUri != null) {
            formDataParams.put("redirect_uri", this.redirectUri);
        }
        if (this.refreshToken != null) {
            formDataParams.put("refresh_token", this.refreshToken);
        }
        if (this.username != null) {
            formDataParams.put("username", this.username);
        }
        if (this.grantType != null) {
            formDataParams.put("grant_type", this.grantType);
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
        result.put("code","code");
        result.put("extend_exp","extendExp");
        result.put("namespace","namespace");
        result.put("password","password");
        result.put("redirect_uri","redirectUri");
        result.put("refresh_token","refreshToken");
        result.put("username","username");
        result.put("grant_type","grantType");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "grantType"        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.grantType == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public OauthmodelTokenResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OauthmodelTokenResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}