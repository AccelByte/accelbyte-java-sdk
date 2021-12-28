package net.accelbyte.sdk.api.legal.operations.policies;

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
public class RetrieveLatestPoliciesByNamespaceAndCountryPublic extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/agreement/public/policies/namespaces/{namespace}/countries/{countryCode}";

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
    private String countryCode;
    private String namespace;
    private Boolean alwaysIncludeDefault;
    private Boolean defaultOnEmpty;
    private String policyType;
    private String tags;

    /**
    * @param countryCode required
    * @param namespace required
    */
    public RetrieveLatestPoliciesByNamespaceAndCountryPublic(
            String countryCode,
            String namespace,
            Boolean alwaysIncludeDefault,
            Boolean defaultOnEmpty,
            String policyType,
            String tags
    )
    {
        this.countryCode = countryCode;
        this.namespace = namespace;
        this.alwaysIncludeDefault = alwaysIncludeDefault;
        this.defaultOnEmpty = defaultOnEmpty;
        this.policyType = policyType;
        this.tags = tags;
    }

    public RetrieveLatestPoliciesByNamespaceAndCountryPublic(){
    }

    public RetrieveLatestPoliciesByNamespaceAndCountryPublic createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.countryCode != null){
            pathParams.put("countryCode", this.countryCode);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("alwaysIncludeDefault", String.valueOf(this.alwaysIncludeDefault));
        queryParams.put("defaultOnEmpty", String.valueOf(this.defaultOnEmpty));
        queryParams.put("policyType", this.policyType);
        queryParams.put("tags", this.tags);
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("countryCode","countryCode");
        result.put("namespace","namespace");
        result.put("alwaysIncludeDefault","alwaysIncludeDefault");
        result.put("defaultOnEmpty","defaultOnEmpty");
        result.put("policyType","policyType");
        result.put("tags","tags");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "countryCode",
            "namespace"
        );
    }

    @Override
    public boolean isValid() {
        if(this.countryCode == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public List<RetrievePolicyPublicResponse> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<RetrievePolicyPublicResponse>>() {});
        }
        throw new ResponseException(code, json);
    }
}
