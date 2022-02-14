package net.accelbyte.sdk.api.ugc.operations.admin_tag;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateTagResponse;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateTagRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminUpdateTag
 *
 * Required permission ADMIN:NAMESPACE:{namespace}:UGCCONFIG [UPDATE] updates a
 * tag
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class AdminUpdateTag extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/ugc/v1/admin/namespaces/{namespace}/tags/{tagId}";

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
    private String namespace;
    private String tagId;
    private ModelsCreateTagRequest body;

    /**
    * @param namespace required
    * @param tagId required
    * @param body required
    */
    public AdminUpdateTag(
            String namespace,
            String tagId,
            ModelsCreateTagRequest body
    )
    {
        this.namespace = namespace;
        this.tagId = tagId;
        this.body = body;
    }

    @JsonIgnore
    public AdminUpdateTag createFromJson(String json) throws JsonProcessingException {
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
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.tagId != null){
            pathParams.put("tagId", this.tagId);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public ModelsCreateTagRequest getBodyParams(){
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
        result.put("namespace","namespace");
        result.put("tagId","tagId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "tagId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.tagId == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ModelsCreateTagResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsCreateTagResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}