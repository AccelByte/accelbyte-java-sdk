package net.accelbyte.sdk.api.group.operations.configuration;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.models.ModelsUpdateGroupConfigurationResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsUpdateGroupConfigurationGlobalRulesRequestV1;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class UpdateGroupConfigurationGlobalRuleAdminV1 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/group/v1/admin/namespaces/{namespace}/configuration/{configurationCode}/rules/{allowedAction}";

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
    private String allowedAction;
    private String configurationCode;
    private String namespace;
    private ModelsUpdateGroupConfigurationGlobalRulesRequestV1 body;

    /**
    * @param allowedAction required
    * @param configurationCode required
    * @param namespace required
    * @param body required
    */
    public UpdateGroupConfigurationGlobalRuleAdminV1(
            String allowedAction,
            String configurationCode,
            String namespace,
            ModelsUpdateGroupConfigurationGlobalRulesRequestV1 body
    )
    {
        this.allowedAction = allowedAction;
        this.configurationCode = configurationCode;
        this.namespace = namespace;
        this.body = body;
    }

    @JsonIgnore
    public UpdateGroupConfigurationGlobalRuleAdminV1 createFromJson(String json) throws JsonProcessingException {
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
        if (this.allowedAction != null){
            pathParams.put("allowedAction", this.allowedAction);
        }
        if (this.configurationCode != null){
            pathParams.put("configurationCode", this.configurationCode);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public ModelsUpdateGroupConfigurationGlobalRulesRequestV1 getBodyParams(){
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
        result.put("allowedAction","allowedAction");
        result.put("configurationCode","configurationCode");
        result.put("namespace","namespace");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "allowedAction",
            "configurationCode",
            "namespace"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.allowedAction == null) {
            return false;
        }
        if(this.configurationCode == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ModelsUpdateGroupConfigurationResponseV1 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsUpdateGroupConfigurationResponseV1().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}