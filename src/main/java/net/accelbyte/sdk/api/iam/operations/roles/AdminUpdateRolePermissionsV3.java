package net.accelbyte.sdk.api.iam.operations.roles;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.AccountcommonPermissionsV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class AdminUpdateRolePermissionsV3 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/v3/admin/roles/{roleId}/permissions";

    @JsonIgnore
    private String method = "PUT";

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
    private String roleId;
    private AccountcommonPermissionsV3 body;

    /**
    * @param roleId required
    * @param body required
    */
    public AdminUpdateRolePermissionsV3(
            String roleId,
            AccountcommonPermissionsV3 body
    )
    {
        this.roleId = roleId;
        this.body = body;
    }

    public AdminUpdateRolePermissionsV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.roleId != null){
            pathParams.put("roleId", this.roleId);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public AccountcommonPermissionsV3 getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("roleId","roleId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "roleId"
        );
    }

    @Override
    public boolean isValid() {
        if(this.roleId == null) {
            return false;
        }
        return true;
    }

    @Override
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code != 204){
            throw new ResponseException(code, json);
        }
    }
}
