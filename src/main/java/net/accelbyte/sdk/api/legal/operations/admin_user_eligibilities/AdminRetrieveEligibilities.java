package net.accelbyte.sdk.api.legal.operations.admin_user_eligibilities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.models.RetrieveUserEligibilitiesIndirectResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * adminRetrieveEligibilities
 *
 * Retrieve the active policies and its conformance status by userThis process
 * only supports cross-namespace checking between game namespace and publisher
 * namespace , that means if the active policy already accepted by the same user
 * in publisher namespace, then it will also be considered as eligible in non-
 * publisher namespace.
 * 
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:LEGAL", action=2 (READ)
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminRetrieveEligibilities extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/agreement/admin/namespaces/{namespace}/users/{userId}/eligibilities";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList();

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
    private String publisherUserId;
    private String clientId;
    private String countryCode;

    /**
    * @param namespace required
    * @param userId required
    * @param clientId required
    * @param countryCode required
    */
    public AdminRetrieveEligibilities(
            String namespace,
            String userId,
            String publisherUserId,
            String clientId,
            String countryCode
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.publisherUserId = publisherUserId;
        this.clientId = clientId;
        this.countryCode = countryCode;
    }

    @JsonIgnore
    public AdminRetrieveEligibilities createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("publisherUserId", this.publisherUserId == null ? null : Arrays.asList(this.publisherUserId));
        queryParams.put("clientId", this.clientId == null ? null : Arrays.asList(this.clientId));
        queryParams.put("countryCode", this.countryCode == null ? null : Arrays.asList(this.countryCode));
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
        result.put("namespace","namespace");
        result.put("userId","userId");
        result.put("publisherUserId","publisherUserId");
        result.put("clientId","clientId");
        result.put("countryCode","countryCode");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "userId",

            "clientId",
            "countryCode"
        );
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
        if(this.clientId == null) {
            return false;
        }
        if(this.countryCode == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public RetrieveUserEligibilitiesIndirectResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new RetrieveUserEligibilitiesIndirectResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("publisherUserId", "None");
        result.put("clientId", "None");
        result.put("countryCode", "None");
        return result;
    }
}