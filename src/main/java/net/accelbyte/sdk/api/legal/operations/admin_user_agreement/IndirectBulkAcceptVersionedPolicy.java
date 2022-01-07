package net.accelbyte.sdk.api.legal.operations.admin_user_agreement;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.models.AcceptAgreementResponse;
import net.accelbyte.sdk.api.legal.models.AcceptAgreementRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class IndirectBulkAcceptVersionedPolicy extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/agreement/admin/namespaces/{namespace}/users/{userId}/agreements/policies";

    @JsonIgnore
    private String method = "POST";

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
    private List<AcceptAgreementRequest> body;

    /**
    * @param namespace required
    * @param userId required
    * @param clientId required
    * @param countryCode required
    */
    public IndirectBulkAcceptVersionedPolicy(
            String namespace,
            String userId,
            String publisherUserId,
            String clientId,
            String countryCode,
            List<AcceptAgreementRequest> body
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.publisherUserId = publisherUserId;
        this.clientId = clientId;
        this.countryCode = countryCode;
        this.body = body;
    }

    @JsonIgnore
    public IndirectBulkAcceptVersionedPolicy createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("publisherUserId", this.publisherUserId);
        queryParams.put("clientId", this.clientId);
        queryParams.put("countryCode", this.countryCode);
        return queryParams;
    }

    @Override
    @JsonIgnore
    public List<AcceptAgreementRequest> getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
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
    public AcceptAgreementResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new AcceptAgreementResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
