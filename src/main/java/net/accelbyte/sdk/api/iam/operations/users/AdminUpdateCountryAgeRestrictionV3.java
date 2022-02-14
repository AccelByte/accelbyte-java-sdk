package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelCountryV3Response;
import net.accelbyte.sdk.api.iam.models.ModelCountryAgeRestrictionV3Request;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminUpdateCountryAgeRestrictionV3
 *
 * Required permission 'ADMIN:NAMESPACE:{namespace}:AGERESTRICTION [UPDATE]'
 * action code: 10123
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminUpdateCountryAgeRestrictionV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/admin/namespaces/{namespace}/agerestrictions/countries/{countryCode}";

    @JsonIgnore
    private String method = "PATCH";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("application/json");

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
    private ModelCountryAgeRestrictionV3Request body;

    /**
    * @param countryCode required
    * @param namespace required
    * @param body required
    */
    public AdminUpdateCountryAgeRestrictionV3(
            String countryCode,
            String namespace,
            ModelCountryAgeRestrictionV3Request body
    )
    {
        this.countryCode = countryCode;
        this.namespace = namespace;
        this.body = body;
    }

    @JsonIgnore
    public AdminUpdateCountryAgeRestrictionV3 createFromJson(String json) throws JsonProcessingException {
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
    public ModelCountryAgeRestrictionV3Request getBodyParams(){
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
        result.put("countryCode","countryCode");
        result.put("namespace","namespace");
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
    @JsonIgnore
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
    @JsonIgnore
    public ModelCountryV3Response parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelCountryV3Response().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}