package net.accelbyte.sdk.api.legal.operations.policy_versions;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * retrievePolicyVersions
 *
 * [TODO] Retrieve one or more legal policies with its versions.
 * If the basePolicyId not supplied, then retrieve only all latest policies
 * version with localeId matched.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=2 (READ)
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
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

    @JsonIgnore
    public RetrievePolicyVersions createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }


    @Override
    @JsonIgnore
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("basePolicyId", this.basePolicyId == null ? null : Arrays.asList(this.basePolicyId));
        queryParams.put("localeId", this.localeId == null ? null : Arrays.asList(this.localeId));
        queryParams.put("namespace", this.namespace == null ? null : Arrays.asList(this.namespace));
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
        result.put("basePolicyId","basePolicyId");
        result.put("localeId","localeId");
        result.put("namespace","namespace");
        return result;
    }


    @Override
    @JsonIgnore
    public List<RetrievePolicyVersionResponse> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<RetrievePolicyVersionResponse>>() {});
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("basePolicyId", "None");
        result.put("localeId", "None");
        result.put("namespace", "None");
        return result;
    }
}