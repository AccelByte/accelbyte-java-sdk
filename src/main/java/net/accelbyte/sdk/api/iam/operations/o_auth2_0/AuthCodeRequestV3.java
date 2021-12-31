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
public class AuthCodeRequestV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/oauth/platforms/{platformId}/authorize";

    @JsonIgnore
    private String method = "GET";

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
    private String platformId;
    private String clientId;
    private String redirectUri;
    private String requestId;

    /**
    * @param platformId required
    * @param requestId required
    */
    public AuthCodeRequestV3(
            String platformId,
            String clientId,
            String redirectUri,
            String requestId
    )
    {
        this.platformId = platformId;
        this.clientId = clientId;
        this.redirectUri = redirectUri;
        this.requestId = requestId;
    }

    public AuthCodeRequestV3 createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("client_id", this.clientId);
        queryParams.put("redirect_uri", this.redirectUri);
        queryParams.put("request_id", this.requestId);
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
        result.put("client_id","clientId");
        result.put("redirect_uri","redirectUri");
        result.put("request_id","requestId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "platformId",


            "requestId"
        );
    }

    @Override
    public boolean isValid() {
        if(this.platformId == null) {
            return false;
        }
        if(this.requestId == null) {
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
