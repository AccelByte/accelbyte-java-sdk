package net.accelbyte.sdk.api.group.operations.group;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.models.ModelsGroupResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsUpdateGroupCustomRuleRequestV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class UpdateGroupCustomRulePublicV1 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/group/v1/public/namespaces/{namespace}/groups/{groupId}/rules/custom";

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
    private String groupId;
    private String namespace;
    private ModelsUpdateGroupCustomRuleRequestV1 body;

    /**
    * @param groupId required
    * @param namespace required
    * @param body required
    */
    public UpdateGroupCustomRulePublicV1(
            String groupId,
            String namespace,
            ModelsUpdateGroupCustomRuleRequestV1 body
    )
    {
        this.groupId = groupId;
        this.namespace = namespace;
        this.body = body;
    }

    public UpdateGroupCustomRulePublicV1(){
    }

    public UpdateGroupCustomRulePublicV1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.groupId != null){
            pathParams.put("groupId", this.groupId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public ModelsUpdateGroupCustomRuleRequestV1 getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("groupId","groupId");
        result.put("namespace","namespace");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "groupId",
            "namespace"
        );
    }

    @Override
    public boolean isValid() {
        if(this.groupId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsGroupResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsGroupResponseV1().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
