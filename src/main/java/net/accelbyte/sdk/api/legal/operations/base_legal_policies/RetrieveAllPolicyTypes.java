package net.accelbyte.sdk.api.legal.operations.base_legal_policies;

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
public class RetrieveAllPolicyTypes extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/agreement/admin/policy-types";

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
    private Integer offset;
    private Integer limit;

    /**
    * @param limit required
    */
    public RetrieveAllPolicyTypes(
            Integer offset,
            Integer limit
    )
    {
        this.offset = offset;
        this.limit = limit;
    }

    public RetrieveAllPolicyTypes createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }


    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("offset", String.valueOf(this.offset));
        queryParams.put("limit", String.valueOf(this.limit));
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("offset","offset");
        result.put("limit","limit");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(

            "limit"
        );
    }

    @Override
    public boolean isValid() {
        if(this.limit == null) {
            return false;
        }
        return true;
    }

    @Override
    public List<RetrievePolicyTypeResponse> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<RetrievePolicyTypeResponse>>() {});
        }
        throw new ResponseException(code, json);
    }
}
