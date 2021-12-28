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
public class PlatformAuthenticationV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/platforms/{platformId}/authenticate";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("*/*");

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

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
    private String openidAssocHandle;
    private String openidClaimedId;
    private String openidIdentity;
    private String openidMode;
    private String openidNs;
    private String openidOpEndpoint;
    private String openidResponseNonce;
    private String openidReturnTo;
    private String openidSig;
    private String openidSigned;
    private String state;

    /**
    * @param platformId required
    * @param state required
    */
    public PlatformAuthenticationV3(
            String platformId,
            String code,
            String error,
            String openidAssocHandle,
            String openidClaimedId,
            String openidIdentity,
            String openidMode,
            String openidNs,
            String openidOpEndpoint,
            String openidResponseNonce,
            String openidReturnTo,
            String openidSig,
            String openidSigned,
            String state
    )
    {
        this.platformId = platformId;
        this.code = code;
        this.error = error;
        this.openidAssocHandle = openidAssocHandle;
        this.openidClaimedId = openidClaimedId;
        this.openidIdentity = openidIdentity;
        this.openidMode = openidMode;
        this.openidNs = openidNs;
        this.openidOpEndpoint = openidOpEndpoint;
        this.openidResponseNonce = openidResponseNonce;
        this.openidReturnTo = openidReturnTo;
        this.openidSig = openidSig;
        this.openidSigned = openidSigned;
        this.state = state;
    }

    public PlatformAuthenticationV3(){
    }

    public PlatformAuthenticationV3 createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("openidAssocHandle", this.openidAssocHandle);
        queryParams.put("openidClaimedId", this.openidClaimedId);
        queryParams.put("openidIdentity", this.openidIdentity);
        queryParams.put("openidMode", this.openidMode);
        queryParams.put("openidNs", this.openidNs);
        queryParams.put("openidOpEndpoint", this.openidOpEndpoint);
        queryParams.put("openidResponseNonce", this.openidResponseNonce);
        queryParams.put("openidReturnTo", this.openidReturnTo);
        queryParams.put("openidSig", this.openidSig);
        queryParams.put("openidSigned", this.openidSigned);
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
        result.put("openid.assoc_handle","openidAssocHandle");
        result.put("openid.claimed_id","openidClaimedId");
        result.put("openid.identity","openidIdentity");
        result.put("openid.mode","openidMode");
        result.put("openid.ns","openidNs");
        result.put("openid.op_endpoint","openidOpEndpoint");
        result.put("openid.response_nonce","openidResponseNonce");
        result.put("openid.return_to","openidReturnTo");
        result.put("openid.sig","openidSig");
        result.put("openid.signed","openidSigned");
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
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code != 302){
            throw new ResponseException(code, json);
        }
    }
}
