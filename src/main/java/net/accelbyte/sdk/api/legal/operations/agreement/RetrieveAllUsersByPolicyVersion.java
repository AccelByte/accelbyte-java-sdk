package net.accelbyte.sdk.api.legal.operations.agreement;

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

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class RetrieveAllUsersByPolicyVersion extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/agreement/admin/agreements/policy-versions/users";

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
    private String keyword;
    private Integer limit;
    private Integer offset;
    private String policyVersionId;

    /**
    * @param policyVersionId required
    */
    public RetrieveAllUsersByPolicyVersion(
            String keyword,
            Integer limit,
            Integer offset,
            String policyVersionId
    )
    {
        this.keyword = keyword;
        this.limit = limit;
        this.offset = offset;
        this.policyVersionId = policyVersionId;
    }

    @JsonIgnore
    public RetrieveAllUsersByPolicyVersion createFromJson(String json) throws JsonProcessingException {
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
        queryParams.put("keyword", this.keyword == null ? null : Arrays.asList(this.keyword));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("policyVersionId", this.policyVersionId == null ? null : Arrays.asList(this.policyVersionId));
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
        result.put("keyword","keyword");
        result.put("limit","limit");
        result.put("offset","offset");
        result.put("policyVersionId","policyVersionId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(



            "policyVersionId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.policyVersionId == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public List<PagedRetrieveUserAcceptedAgreementResponse> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<PagedRetrieveUserAcceptedAgreementResponse>>() {});
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("keyword", "None");
        result.put("limit", "None");
        result.put("offset", "None");
        result.put("policyVersionId", "None");
        return result;
    }
}