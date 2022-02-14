package net.accelbyte.sdk.api.iam.operations.roles;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.AccountcommonRole;
import net.accelbyte.sdk.api.iam.models.ModelRoleCreateRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * CreateRole
 *
 * 
 * 
 * Required permission 'ROLE:ADMIN [CREATE]' or 'ADMIN:ROLE [CREATE]'
 * 
 * Required Permission 'ROLE:ADMIN [CREATE]' is going to be DEPRECATED for
 * security purpose. It is going to be deprecated on 31 JANUARY 2019 , please use
 * permission 'ADMIN:ROLE [CREATE]' instead.
 * 
 * Role can only be assigned to other users by the role's manager.
 * 
 * If role is an administrator role (i.e. AdminRole == true), it will list out
 * the role's members.
 * 
 * Administrator role can be created only when at least 1 manager is specified.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class CreateRole extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/roles";

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
    private ModelRoleCreateRequest body;

    /**
    * @param body required
    */
    public CreateRole(
            ModelRoleCreateRequest body
    )
    {
        this.body = body;
    }

    @JsonIgnore
    public CreateRole createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }



    @Override
    @JsonIgnore
    public ModelRoleCreateRequest getBodyParams(){
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
    public AccountcommonRole parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new AccountcommonRole().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}