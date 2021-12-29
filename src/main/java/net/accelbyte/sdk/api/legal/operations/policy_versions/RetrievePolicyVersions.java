package net.accelbyte.sdk.api.legal.operations.policy_versions;

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
public class RetrievePolicyVersions extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/agreement/public/policies";

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
    private String basePolicyId;
    private String localeId;
    private String namespace;

    /**
    */
    public RetrievePolicyVersions(
            String basePolicyId,
            String localeId,
            String namespace
    )
    {
        this.basePolicyId = basePolicyId;
        this.localeId = localeId;
        this.namespace = namespace;
    }

    public RetrievePolicyVersions(){
    }

    public RetrievePolicyVersions createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }


    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("basePolicyId", this.basePolicyId);
        queryParams.put("localeId", this.localeId);
        queryParams.put("namespace", this.namespace);
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("basePolicyId","basePolicyId");
        result.put("localeId","localeId");
        result.put("namespace","namespace");
        return result;
    }


    @Override
    public List<RetrievePolicyVersionResponse> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<RetrievePolicyVersionResponse>>() {});
        }
        throw new ResponseException(code, json);
    }
}
