package net.accelbyte.sdk.api.iam.operations.o_auth2_0;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponseV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class TokenGrantV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/oauth/token";

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
    private String clientId;
    private String code;
    private String codeVerifier;
    private String redirectUri;
    private String refreshToken;
    private String grantType;

    /**
    * @param grantType required
    */
    public TokenGrantV3(
            String clientId,
            String code,
            String codeVerifier,
            String redirectUri,
            String refreshToken,
            String grantType
    )
    {
        this.clientId = clientId;
        this.code = code;
        this.codeVerifier = codeVerifier;
        this.redirectUri = redirectUri;
        this.refreshToken = refreshToken;
        this.grantType = grantType;
    }

    public TokenGrantV3(){
    }

    public TokenGrantV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }




    @Override
    @JsonIgnore
    public Map<String, String> getFormDataParams(){
        Map<String, String> formDataParams = new HashMap<>();
        formDataParams.put("clientId", this.clientId);
        formDataParams.put("code", this.code);
        formDataParams.put("codeVerifier", this.codeVerifier);
        formDataParams.put("redirectUri", this.redirectUri);
        formDataParams.put("refreshToken", this.refreshToken);
        formDataParams.put("grantType", this.grantType);
        return formDataParams;
    }

    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("client_id","clientId");
        result.put("code","code");
        result.put("code_verifier","codeVerifier");
        result.put("redirect_uri","redirectUri");
        result.put("refresh_token","refreshToken");
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
    public OauthmodelTokenResponseV3 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OauthmodelTokenResponseV3().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
