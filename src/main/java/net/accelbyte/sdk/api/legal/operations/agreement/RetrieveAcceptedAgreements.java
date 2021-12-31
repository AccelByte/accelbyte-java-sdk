package net.accelbyte.sdk.api.legal.operations.agreement;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class RetrieveAcceptedAgreements extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/agreement/admin/agreements/policies/users/{userId}";

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
    private String userId;

    /**
    * @param userId required
    */
    public RetrieveAcceptedAgreements(
            String userId
    )
    {
        this.userId = userId;
    }

    public RetrieveAcceptedAgreements createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

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
    public boolean isValid() {
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    @Override
    public List<RetrieveAcceptedAgreementResponse> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<RetrieveAcceptedAgreementResponse>>() {});
        }
        throw new ResponseException(code, json);
    }
}
