package net.accelbyte.sdk.api.iam.operations.sso_saml_2_0;

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
public class PlatformAuthenticateSAMLV3Handler extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/sso/saml/platforms/{platformId}/authenticate";

    @JsonIgnore
    private String method = "POST";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");

    @JsonIgnore
    private List<String> produces = Arrays.asList();

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = "PLACEHOLDER";

    /**
     * fields as input parameter
     */
    private String platformId;
    private String code;
    private String error;
    private String state;

    /**
    * @param platformId required
    * @param state required
    */
    public PlatformAuthenticateSAMLV3Handler(
            String platformId,
            String code,
            String error,
            String state
    )
    {
        this.platformId = platformId;
        this.code = code;
        this.error = error;
        this.state = state;
    }

    public PlatformAuthenticateSAMLV3Handler(){
    }

    public PlatformAuthenticateSAMLV3Handler createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.platformId != null){
            pathParams.put("platformId", this.platformId);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("code", this.code);
        queryParams.put("error", this.error);
        queryParams.put("state", this.state);
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("platformId","platformId");
        result.put("code","code");
        result.put("error","error");
        result.put("state","state");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "platformId",


            "state"
        );
    }

    @Override
    public boolean isValid() {
        if(this.platformId == null) {
            return false;
        }
        if(this.state == null) {
            return false;
        }
        return true;
    }

    @Override
    public String parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code != 302){
            throw new ResponseException(code, json);
        }
        return json;
    }
}
