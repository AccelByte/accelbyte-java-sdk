package net.accelbyte.sdk.api.ugc.operations.admin_content;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.models.ModelsPaginatedContentDownloadResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class AdminSearchChannelSpecificContent extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/ugc/v1/admin/namespaces/{namespace}/channels/{channelId}/contents/search";

    @JsonIgnore
    private String method = "GET";

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
    private String channelId;
    private String namespace;
    private String creator;
    private String isofficial;
    private String limit;
    private String name;
    private String offset;
    private String orderby;
    private String sortby;
    private String subtype;
    private String tags;
    private String type;
    private String userId;

    /**
    * @param channelId required
    * @param namespace required
    */
    public AdminSearchChannelSpecificContent(
            String channelId,
            String namespace,
            String creator,
            String isofficial,
            String limit,
            String name,
            String offset,
            String orderby,
            String sortby,
            String subtype,
            String tags,
            String type,
            String userId
    )
    {
        this.channelId = channelId;
        this.namespace = namespace;
        this.creator = creator;
        this.isofficial = isofficial;
        this.limit = limit;
        this.name = name;
        this.offset = offset;
        this.orderby = orderby;
        this.sortby = sortby;
        this.subtype = subtype;
        this.tags = tags;
        this.type = type;
        this.userId = userId;
    }

    public AdminSearchChannelSpecificContent createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.channelId != null){
            pathParams.put("channelId", this.channelId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, String> getQueryParams(){
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("creator", this.creator);
        queryParams.put("isofficial", this.isofficial);
        queryParams.put("limit", this.limit);
        queryParams.put("name", this.name);
        queryParams.put("offset", this.offset);
        queryParams.put("orderby", this.orderby);
        queryParams.put("sortby", this.sortby);
        queryParams.put("subtype", this.subtype);
        queryParams.put("tags", this.tags);
        queryParams.put("type", this.type);
        queryParams.put("userId", this.userId);
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("channelId","channelId");
        result.put("namespace","namespace");
        result.put("creator","creator");
        result.put("isofficial","isofficial");
        result.put("limit","limit");
        result.put("name","name");
        result.put("offset","offset");
        result.put("orderby","orderby");
        result.put("sortby","sortby");
        result.put("subtype","subtype");
        result.put("tags","tags");
        result.put("type","type");
        result.put("userId","userId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "channelId",
            "namespace"
        );
    }

    @Override
    public boolean isValid() {
        if(this.channelId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsPaginatedContentDownloadResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsPaginatedContentDownloadResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
