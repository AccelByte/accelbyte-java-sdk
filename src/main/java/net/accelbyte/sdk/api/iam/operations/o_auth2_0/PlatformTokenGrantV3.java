package net.accelbyte.sdk.api.iam.operations.o_auth2_0;

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
public class PlatformTokenGrantV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/oauth/platforms/{platformId}/token";

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
    private String platformId;
    private String clientId;
    private String deviceId;
    private String platformToken;

    /**
    * @param platformId required
    */
    public PlatformTokenGrantV3(
            String platformId,
            String clientId,
            String deviceId,
            String platformToken
    )
    {
        this.platformId = platformId;
        this.clientId = clientId;
        this.deviceId = deviceId;
        this.platformToken = platformToken;
    }

    public PlatformTokenGrantV3 createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, String> getFormDataParams(){
        Map<String, String> formDataParams = new HashMap<>();
        formDataParams.put("client_id", this.clientId);
        formDataParams.put("device_id", this.deviceId);
        formDataParams.put("platform_token", this.platformToken);
        return formDataParams;
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
        result.put("device_id","deviceId");
        result.put("platform_token","platformToken");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "platformId"
        );
    }

    @Override
    public boolean isValid() {
        if(this.platformId == null) {
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
