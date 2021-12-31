package net.accelbyte.sdk.api.platform.operations.reward;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.ConditionMatchResult;
import net.accelbyte.sdk.api.platform.models.EventPayload;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class CheckEventCondition extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/admin/namespaces/{namespace}/rewards/{rewardId}/match";

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
    private String namespace;
    private String rewardId;
    private EventPayload body;

    /**
    * @param namespace required
    * @param rewardId required
    */
    public CheckEventCondition(
            String namespace,
            String rewardId,
            EventPayload body
    )
    {
        this.namespace = namespace;
        this.rewardId = rewardId;
        this.body = body;
    }

    public CheckEventCondition createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.rewardId != null){
            pathParams.put("rewardId", this.rewardId);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public EventPayload getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("rewardId","rewardId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "rewardId"
        );
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.rewardId == null) {
            return false;
        }
        return true;
    }

    @Override
    public ConditionMatchResult parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ConditionMatchResult().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
