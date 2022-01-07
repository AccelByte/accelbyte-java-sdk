package net.accelbyte.sdk.api.legal.operations.agreement;

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
public class IndirectBulkAcceptVersionedPolicy1 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/agreement/public/agreements/policies/users/{userId}";

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
    private String userId;
    private List<AcceptAgreementRequest> body;

    /**
    * @param userId required
    */
    public IndirectBulkAcceptVersionedPolicy1(
            String userId,
            List<AcceptAgreementRequest> body
    )
    {
        this.userId = userId;
        this.body = body;
    }

    @JsonIgnore
    public IndirectBulkAcceptVersionedPolicy1 createFromJson(String json) throws JsonProcessingException {
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
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
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
        result.put("userId","userId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "userId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public AcceptAgreementResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new AcceptAgreementResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
