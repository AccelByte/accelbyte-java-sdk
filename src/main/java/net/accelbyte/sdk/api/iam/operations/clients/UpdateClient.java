package net.accelbyte.sdk.api.iam.operations.clients;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ClientmodelClientResponse;
import net.accelbyte.sdk.api.iam.models.ClientmodelClientUpdateRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class UpdateClient extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/clients/{clientId}";

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
    private String clientId;
    private ClientmodelClientUpdateRequest body;

    /**
    * @param clientId required
    * @param body required
    */
    public UpdateClient(
            String clientId,
            ClientmodelClientUpdateRequest body
    )
    {
        this.clientId = clientId;
        this.body = body;
    }

    public UpdateClient(){
    }

    public UpdateClient createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.clientId != null){
            pathParams.put("clientId", this.clientId);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public ClientmodelClientUpdateRequest getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("clientId","clientId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "clientId"
        );
    }

    @Override
    public boolean isValid() {
        if(this.clientId == null) {
            return false;
        }
        return true;
    }

    @Override
    public ClientmodelClientResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ClientmodelClientResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}