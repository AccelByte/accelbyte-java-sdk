package net.accelbyte.sdk.api.basic.operations.misc;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * deleteCountryGroup
 *
 * Delete a country groups by its country group code. This endpoint usually used
 * for testing purpose to cleanup test data.
 * Other detail info:
 * 
 *   * Required permission : resource = "ADMIN:NAMESPACE:{namespace}:MISC" , action=8 (DELETE)
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class DeleteCountryGroup extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/basic/v1/admin/namespaces/{namespace}/misc/countrygroups/{countryGroupCode}";

    @JsonIgnore
    private String method = "DELETE";

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
    private String countryGroupCode;
    private String namespace;

    /**
    * @param countryGroupCode required
    * @param namespace required
    */
    public DeleteCountryGroup(
            String countryGroupCode,
            String namespace
    )
    {
        this.countryGroupCode = countryGroupCode;
        this.namespace = namespace;
    }

    @JsonIgnore
    public DeleteCountryGroup createFromJson(String json) throws JsonProcessingException {
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
        if (this.countryGroupCode != null){
            pathParams.put("countryGroupCode", this.countryGroupCode);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }




    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("countryGroupCode","countryGroupCode");
        result.put("namespace","namespace");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "countryGroupCode",
            "namespace"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.countryGroupCode == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 200){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}