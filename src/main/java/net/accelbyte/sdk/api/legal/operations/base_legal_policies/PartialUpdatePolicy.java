package net.accelbyte.sdk.api.legal.operations.base_legal_policies;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.models.UpdateBasePolicyResponse;
import net.accelbyte.sdk.api.legal.models.UpdateBasePolicyRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * partialUpdatePolicy
 *
 * Update an existing base policy.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=4 (UPDATE)
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class PartialUpdatePolicy extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/agreement/admin/base-policies/{basePolicyId}";

    @JsonIgnore
    private String method = "PATCH";

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
    private UpdateBasePolicyRequest body;

    /**
    * @param basePolicyId required
    */
    public PartialUpdatePolicy(
            String basePolicyId,
            UpdateBasePolicyRequest body
    )
    {
        this.basePolicyId = basePolicyId;
        this.body = body;
    }

    @JsonIgnore
    public PartialUpdatePolicy createFromJson(String json) throws JsonProcessingException {
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
        if (this.basePolicyId != null){
            pathParams.put("basePolicyId", this.basePolicyId);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public UpdateBasePolicyRequest getBodyParams(){
        return this.body;
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
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "basePolicyId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.basePolicyId == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public UpdateBasePolicyResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new UpdateBasePolicyResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}