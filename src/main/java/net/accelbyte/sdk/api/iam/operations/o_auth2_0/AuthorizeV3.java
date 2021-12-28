package net.accelbyte.sdk.api.iam.operations.o_auth2_0;

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
public class AuthorizeV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/oauth/authorize";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = "request_id";

    /**
     * fields as input parameter
     */
    private String codeChallenge;
    private String codeChallengeMethod;
    private String redirectUri;
    private String scope;
    private String state;
    private String targetAuthPage;
    private String clientId;
    private String responseType;

    /**
    * @param clientId required
    * @param responseType required
    */
    public AuthorizeV3(
            String codeChallenge,
            String codeChallengeMethod,
            String redirectUri,
            String scope,
            String state,
            String targetAuthPage,
            String clientId,
            String responseType
    )
    {
        this.codeChallenge = codeChallenge;
        this.codeChallengeMethod = codeChallengeMethod;
        this.redirectUri = redirectUri;
        this.scope = scope;
        this.state = state;
        this.targetAuthPage = targetAuthPage;
        this.clientId = clientId;
        this.responseType = responseType;
    }

    public AuthorizeV3(){
    }

    public AuthorizeV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }


    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("codeChallenge", this.codeChallenge);
        queryParams.put("codeChallengeMethod", this.codeChallengeMethod);
        queryParams.put("redirectUri", this.redirectUri);
        queryParams.put("scope", this.scope);
        queryParams.put("state", this.state);
        queryParams.put("targetAuthPage", this.targetAuthPage);
        queryParams.put("clientId", this.clientId);
        queryParams.put("responseType", this.responseType);
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("code_challenge","codeChallenge");
        result.put("code_challenge_method","codeChallengeMethod");
        result.put("redirect_uri","redirectUri");
        result.put("scope","scope");
        result.put("state","state");
        result.put("target_auth_page","targetAuthPage");
        result.put("client_id","clientId");
        result.put("response_type","responseType");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(






            "clientId",
            "responseType"
        );
    }

    @Override
    public boolean isValid() {
        if(this.clientId == null) {
            return false;
        }
        if(this.responseType == null) {
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