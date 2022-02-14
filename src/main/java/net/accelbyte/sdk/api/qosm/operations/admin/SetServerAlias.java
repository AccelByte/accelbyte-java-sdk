package net.accelbyte.sdk.api.qosm.operations.admin;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.qosm.models.*;
import net.accelbyte.sdk.api.qosm.models.ModelsSetAliasRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * SetServerAlias
 *
 * ``` Required permission: ADMIN:QOS:SERVER [UDPATE] Required scope: social This
 * endpoint modifies a registered QoS service's region alias. ```
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class SetServerAlias extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/qosm/admin/servers/{region}/alias";

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
    private String region;
    private ModelsSetAliasRequest body;

    /**
    * @param region required
    * @param body required
    */
    public SetServerAlias(
            String region,
            ModelsSetAliasRequest body
    )
    {
        this.region = region;
        this.body = body;
    }

    @JsonIgnore
    public SetServerAlias createFromJson(String json) throws JsonProcessingException {
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
        if (this.region != null){
            pathParams.put("region", this.region);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public ModelsSetAliasRequest getBodyParams(){
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
        result.put("region","region");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "region"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.region == null) {
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