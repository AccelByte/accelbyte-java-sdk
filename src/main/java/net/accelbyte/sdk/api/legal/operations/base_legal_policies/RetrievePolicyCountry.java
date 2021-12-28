package net.accelbyte.sdk.api.legal.operations.base_legal_policies;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.models.RetrievePolicyResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class RetrievePolicyCountry extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/agreement/admin/base-policies/{basePolicyId}/countries/{countryCode}";

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
    private String countryCode;

    /**
    * @param basePolicyId required
    * @param countryCode required
    */
    public RetrievePolicyCountry(
            String basePolicyId,
            String countryCode
    )
    {
        this.basePolicyId = basePolicyId;
        this.countryCode = countryCode;
    }

    public RetrievePolicyCountry(){
    }

    public RetrievePolicyCountry createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.basePolicyId != null){
            pathParams.put("basePolicyId", this.basePolicyId);
        }
        if (this.countryCode != null){
            pathParams.put("countryCode", this.countryCode);
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
        result.put("basePolicyId","basePolicyId");
        result.put("countryCode","countryCode");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "basePolicyId",
            "countryCode"
        );
    }

    @Override
    public boolean isValid() {
        if(this.basePolicyId == null) {
            return false;
        }
        if(this.countryCode == null) {
            return false;
        }
        return true;
    }

    @Override
    public RetrievePolicyResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new RetrievePolicyResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}