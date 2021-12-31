package net.accelbyte.sdk.api.iam.operations.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
import java.util.*;

@Getter
@Setter
public class AddUserPermission extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/namespaces/{namespace}/users/{userId}/permissions/{resource}/{action}";

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
    private String namespace;
    private String resource;
    private String userId;
    private ModelUpdatePermissionScheduleRequest body;

    /**
    * @param action required
    * @param namespace required
    * @param resource required
    * @param userId required
    * @param body required
    */
    public AddUserPermission(
            Integer action,
            String namespace,
            String resource,
            String userId,
            ModelUpdatePermissionScheduleRequest body
    )
    {
        this.action = action;
        this.namespace = namespace;
        this.resource = resource;
        this.userId = userId;
        this.body = body;
    }

    public AddUserPermission createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.action != null){
            pathParams.put("action", String.valueOf(this.action));
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.resource != null){
            pathParams.put("resource", this.resource);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
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
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("action","action");
        result.put("namespace","namespace");
        result.put("resource","resource");
        result.put("userId","userId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "action",
            "namespace",
            "resource",
            "userId"
        );
    }

    @Override
    public boolean isValid() {
        if(this.action == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.resource == null) {
            return false;
        }
        if(this.userId == null) {
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
