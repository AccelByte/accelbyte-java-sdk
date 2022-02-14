package net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * PlatformAuthenticationV3
 *
 * This endpoint authenticates user platform. It validates user to its respective
 * platforms. Deactivated or login-banned users are unable to login.
 * 
 * ## Supported platforms:
 * 
 *                   * steamopenid
 * Steam login page will redirects to this endpoint after login success as
 * previously defined on openID request parameter `openid.return_to` when request
 * login to steam https://openid.net/specs/openid-
 * authentication-2_0.html#anchor27
 * 
 *                   * ps4web
 * PS4 login page will redirects to this endpoint after login success as
 * previously defined on authorize request parameter `redirect_uri`
 * https://ps4.siedev.net/resources/documents/WebAPI/1/Auth_WebAPI-
 * Reference/0002.html#0GetAccessTokenUsingAuthorizationCode
 * 
 *                   * xblweb
 * XBL login page will redirects to this endpoint after login success as
 * previously defined on authorize request parameter `redirect_uri`
 * 
 *                   * epicgames
 * Epicgames login page will redirects to this endpoint after login success or an
 * error occurred. If error, it redirects to the login page.
 * 
 *                   * twitch
 * Twitch login page will redirects to this endpoint after login success as
 * previously defined on authorize request parameter `redirect_uri`
 * 
 *                   * facebook
 * Facebook login page will redirects to this endpoint after login success as
 * previously defined on authorize request parameter `redirect_uri`
 * 
 *                   * google
 * Google login page will redirects to this endpoint after login success as
 * previously defined on authorize request parameter `redirect_uri` action code :
 * 10709
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
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

    @JsonIgnore
    public PlatformAuthenticationV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("code", this.code == null ? null : Arrays.asList(this.code));
        queryParams.put("error", this.error == null ? null : Arrays.asList(this.error));
        queryParams.put("openid.assoc_handle", this.openidAssocHandle == null ? null : Arrays.asList(this.openidAssocHandle));
        queryParams.put("openid.claimed_id", this.openidClaimedId == null ? null : Arrays.asList(this.openidClaimedId));
        queryParams.put("openid.identity", this.openidIdentity == null ? null : Arrays.asList(this.openidIdentity));
        queryParams.put("openid.mode", this.openidMode == null ? null : Arrays.asList(this.openidMode));
        queryParams.put("openid.ns", this.openidNs == null ? null : Arrays.asList(this.openidNs));
        queryParams.put("openid.op_endpoint", this.openidOpEndpoint == null ? null : Arrays.asList(this.openidOpEndpoint));
        queryParams.put("openid.response_nonce", this.openidResponseNonce == null ? null : Arrays.asList(this.openidResponseNonce));
        queryParams.put("openid.return_to", this.openidReturnTo == null ? null : Arrays.asList(this.openidReturnTo));
        queryParams.put("openid.sig", this.openidSig == null ? null : Arrays.asList(this.openidSig));
        queryParams.put("openid.signed", this.openidSigned == null ? null : Arrays.asList(this.openidSigned));
        queryParams.put("state", this.state == null ? null : Arrays.asList(this.state));
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
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
    @JsonIgnore
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
    @JsonIgnore
    public String parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code != 302){
            throw new ResponseException(code, json);
        }
        return json;
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("code", "None");
        result.put("error", "None");
        result.put("openid.assoc_handle", "None");
        result.put("openid.claimed_id", "None");
        result.put("openid.identity", "None");
        result.put("openid.mode", "None");
        result.put("openid.ns", "None");
        result.put("openid.op_endpoint", "None");
        result.put("openid.response_nonce", "None");
        result.put("openid.return_to", "None");
        result.put("openid.sig", "None");
        result.put("openid.signed", "None");
        result.put("state", "None");
        return result;
    }
}