package net.accelbyte.sdk.api.iam.operations.clients;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class DeleteClientPermission extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/clients/{clientId}/clientpermissions/{resource}/{action}";

    @JsonIgnore
    private String method = "DELETE";

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
    private String clientId;
    private String resource;

    /**
    * @param action required
    * @param clientId required
    * @param resource required
    */
    public DeleteClientPermission(
            Integer action,
            String clientId,
            String resource
    )
    {
        this.action = action;
        this.clientId = clientId;
        this.resource = resource;
    }

    public DeleteClientPermission(){
    }

    public DeleteClientPermission createFromJson(String json) throws JsonProcessingException {
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
        if (this.clientId != null){
            pathParams.put("clientId", this.clientId);
        }
        if (this.resource != null){
            pathParams.put("resource", this.resource);
        }
        return pathParams;
    }




    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("action","action");
        result.put("clientId","clientId");
        result.put("resource","resource");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "action",
            "clientId",
            "resource"
        );
    }

    @Override
    public boolean isValid() {
        if(this.action == null) {
            return false;
        }
        if(this.clientId == null) {
            return false;
        }
        if(this.resource == null) {
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
