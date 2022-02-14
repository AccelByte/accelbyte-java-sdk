package net.accelbyte.sdk.api.iam.operations.users;

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
 * ListCrossNamespaceAccountLink
 *
 * 
 * 
 * ## The endpoint is going to be deprecated at 9 July, 2018. Please use this
 * instead: /users/{userId}/platforms/{platformId}/link
 * 
 * Required permission 'NAMESPACE:{namespace}:USER:{userId} [UPDATE]'.
 * 
 * Access token from original namespace is needed as authorization header. Access
 * token from designated account needed as form parameter to verify the ownership
 * of that account. When platformID (device platfom ID) is specified, platform
 * login method for that specific platform ID is removed. This means to protect
 * account from second hand device usage.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class ListCrossNamespaceAccountLink extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/namespaces/{namespace}/users/{userId}/crosslink";

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
    private String namespace;
    private String userId;
    private String platformId;
    private String linkingToken;

    /**
    * @param namespace required
    * @param userId required
    * @param linkingToken required
    */
    public ListCrossNamespaceAccountLink(
            String namespace,
            String userId,
            String platformId,
            String linkingToken
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.platformId = platformId;
        this.linkingToken = linkingToken;
    }

    @JsonIgnore
    public ListCrossNamespaceAccountLink createFromJson(String json) throws JsonProcessingException {
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
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }



    @Override
    @JsonIgnore
    public Map<String, Object> getFormDataParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.platformId != null) {
            formDataParams.put("platformId", this.platformId);
        }
        if (this.linkingToken != null) {
            formDataParams.put("linkingToken", this.linkingToken);
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
        result.put("namespace","namespace");
        result.put("userId","userId");
        result.put("platformId","platformId");
        result.put("linkingToken","linkingToken");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "userId",
            "linkingToken"        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        if(this.linkingToken == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 200){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}