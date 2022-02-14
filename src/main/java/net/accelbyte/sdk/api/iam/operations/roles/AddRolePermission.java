package net.accelbyte.sdk.api.iam.operations.roles;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelUpdatePermissionScheduleRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AddRolePermission extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/roles/{roleId}/permissions/{resource}/{action}";

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
    private Integer action;
    private String resource;
    private String roleId;
    private ModelUpdatePermissionScheduleRequest body;

    /**
    * @param action required
    * @param resource required
    * @param roleId required
    * @param body required
    */
    public AddRolePermission(
            Integer action,
            String resource,
            String roleId,
            ModelUpdatePermissionScheduleRequest body
    )
    {
        this.action = action;
        this.resource = resource;
        this.roleId = roleId;
        this.body = body;
    }

    @JsonIgnore
    public AddRolePermission createFromJson(String json) throws JsonProcessingException {
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
        if (this.action != null){
            pathParams.put("action", this.action == null ? null : String.valueOf(this.action));
        }
        if (this.resource != null){
            pathParams.put("resource", this.resource);
        }
        if (this.roleId != null){
            pathParams.put("roleId", this.roleId);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public ModelUpdatePermissionScheduleRequest getBodyParams(){
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
        result.put("action","action");
        result.put("resource","resource");
        result.put("roleId","roleId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "action",
            "resource",
            "roleId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.action == null) {
            return false;
        }
        if(this.resource == null) {
            return false;
        }
        if(this.roleId == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        if(code != 204){
            String json = this.convertInputStreamToString(payload);
            throw new ResponseException(code, json);
        }
    }

}