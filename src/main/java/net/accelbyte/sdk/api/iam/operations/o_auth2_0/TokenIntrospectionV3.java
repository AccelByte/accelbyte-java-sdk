package net.accelbyte.sdk.api.iam.operations.o_auth2_0;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenIntrospectResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * TokenIntrospectionV3
 *
 * 
 * 
 * This endpoint returns information about an access token intended to be used by
 * resource servers or other internal servers.
 * 
 * This endpoint requires authorized requests header with valid basic or bearer
 * token.
 * 
 * action code : 10705
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class TokenIntrospectionV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/oauth/introspect";

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
    private String token;

    /**
    * @param token required
    */
    public TokenIntrospectionV3(
            String token
    )
    {
        this.token = token;
    }

    @JsonIgnore
    public TokenIntrospectionV3 createFromJson(String json) throws JsonProcessingException {
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
        if (this.token != null) {
            formDataParams.put("token", this.token);
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
        result.put("token","token");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "token"        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.token == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public OauthmodelTokenIntrospectResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OauthmodelTokenIntrospectResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}