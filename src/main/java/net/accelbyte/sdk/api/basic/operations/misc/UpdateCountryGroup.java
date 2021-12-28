package net.accelbyte.sdk.api.basic.operations.misc;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.models.CountryGroupObject;
import net.accelbyte.sdk.api.basic.models.UpdateCountryGroupRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class UpdateCountryGroup extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/basic/v1/admin/namespaces/{namespace}/misc/countrygroups/{countryGroupCode}";

    @JsonIgnore
    private String method = "PUT";

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
    private UpdateCountryGroupRequest body;

    /**
    * @param countryGroupCode required
    * @param namespace required
    */
    public UpdateCountryGroup(
            String countryGroupCode,
            String namespace,
            UpdateCountryGroupRequest body
    )
    {
        this.countryGroupCode = countryGroupCode;
        this.namespace = namespace;
        this.body = body;
    }

    public UpdateCountryGroup(){
    }

    public UpdateCountryGroup createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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
    public UpdateCountryGroupRequest getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

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
    public CountryGroupObject parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new CountryGroupObject().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
