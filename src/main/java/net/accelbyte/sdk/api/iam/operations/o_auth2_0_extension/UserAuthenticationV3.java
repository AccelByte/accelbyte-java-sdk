package net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
import java.util.*;

@Getter
@Setter
public class UserAuthenticationV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/authenticate";

    @JsonIgnore
    private String method = "POST";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = "code";

    /**
     * fields as input parameter
     */
    private String clientId;
    private Boolean extendExp;
    private String redirectUri;
    private String password;
    private String requestId;
    private String userName;

    /**
    * @param password required
    * @param requestId required
    * @param userName required
    */
    public UserAuthenticationV3(
            String clientId,
            Boolean extendExp,
            String redirectUri,
            String password,
            String requestId,
            String userName
    )
    {
        this.clientId = clientId;
        this.extendExp = extendExp;
        this.redirectUri = redirectUri;
        this.password = password;
        this.requestId = requestId;
        this.userName = userName;
    }

    public UserAuthenticationV3(){
    }

    public UserAuthenticationV3 createFromJson(String json) throws JsonProcessingException {
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
        formDataParams.put("extendExp", String.valueOf(this.extendExp));
        formDataParams.put("redirectUri", this.redirectUri);
        formDataParams.put("password", this.password);
        formDataParams.put("requestId", this.requestId);
        formDataParams.put("userName", this.userName);
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
        result.put("extend_exp","extendExp");
        result.put("redirect_uri","redirectUri");
        result.put("password","password");
        result.put("request_id","requestId");
        result.put("user_name","userName");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "password",            "requestId",            "userName"        );
    }

    @Override
    public boolean isValid() {
        if(this.password == null) {
            return false;
        }
        if(this.requestId == null) {
            return false;
        }
        if(this.userName == null) {
            return false;
        }
        return true;
    }

    @Override
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code != 302){
            throw new ResponseException(code, json);
        }
    }
}