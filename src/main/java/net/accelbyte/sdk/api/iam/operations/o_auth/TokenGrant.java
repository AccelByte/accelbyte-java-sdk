package net.accelbyte.sdk.api.iam.operations.o_auth;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
import java.util.*;

@Getter
@Setter
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

    public TokenGrant createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }




    @Override
    @JsonIgnore
    public Map<String, String> getFormDataParams(){
        Map<String, String> formDataParams = new HashMap<>();
        formDataParams.put("code", this.code);
        formDataParams.put("extend_exp", String.valueOf(this.extendExp));
        formDataParams.put("namespace", this.namespace);
        formDataParams.put("password", this.password);
        formDataParams.put("redirect_uri", this.redirectUri);
        formDataParams.put("refresh_token", this.refreshToken);
        formDataParams.put("username", this.username);
        formDataParams.put("grant_type", this.grantType);
        return formDataParams;
    }

    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

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
    public boolean isValid() {
        if(this.grantType == null) {
            return false;
        }
        return true;
    }

    @Override
    public OauthmodelTokenResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OauthmodelTokenResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
