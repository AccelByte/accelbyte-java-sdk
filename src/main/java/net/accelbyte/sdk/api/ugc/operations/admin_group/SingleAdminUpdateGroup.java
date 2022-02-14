package net.accelbyte.sdk.api.ugc.operations.admin_group;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateGroupResponse;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateGroupRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * SingleAdminUpdateGroup
 *
 * Required permission ADMIN:NAMESPACE:{namespace}:USER:{userId}:CONTENTGROUP
 * [UPDATE] replace group name and contents with new ones.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class SingleAdminUpdateGroup extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/ugc/v1/admin/namespaces/{namespace}/groups/{groupId}";

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
    private ModelsCreateGroupRequest body;

    /**
    * @param groupId required
    * @param namespace required
    * @param body required
    */
    public SingleAdminUpdateGroup(
            String groupId,
            String namespace,
            ModelsCreateGroupRequest body
    )
    {
        this.groupId = groupId;
        this.namespace = namespace;
        this.body = body;
    }

    @JsonIgnore
    public SingleAdminUpdateGroup createFromJson(String json) throws JsonProcessingException {
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
    public ModelsCreateGroupRequest getBodyParams(){
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
    @JsonIgnore
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
    @JsonIgnore
    public ModelsCreateGroupResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsCreateGroupResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}