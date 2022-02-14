package net.accelbyte.sdk.api.iam.operations.roles;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelRoleV4Response;
import net.accelbyte.sdk.api.iam.models.ModelRoleV4Request;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminCreateRoleV4
 *
 * Required permission: ADMIN:ROLE [CREATE] Create role request body: -
 * roleName: specify role name, alphanumeric, cannot have special character
 * (required) - adminRole: specify if role is for admin user (default false) -
 * isWildcard: specify if role can be assigned to wildcard (*) namespace (default
 * false) action code: 10401
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminCreateRoleV4 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v4/admin/roles";

    @JsonIgnore
    private String method = "POST";

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
    private ModelRoleV4Request body;

    /**
    * @param body required
    */
    public AdminCreateRoleV4(
            ModelRoleV4Request body
    )
    {
        this.body = body;
    }

    @JsonIgnore
    public AdminCreateRoleV4 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }



    @Override
    @JsonIgnore
    public ModelRoleV4Request getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }


    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        return true;
    }

    @Override
    @JsonIgnore
    public ModelRoleV4Response parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new ModelRoleV4Response().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}