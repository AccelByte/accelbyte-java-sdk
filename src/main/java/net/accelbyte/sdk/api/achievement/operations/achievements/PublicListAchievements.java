package net.accelbyte.sdk.api.achievement.operations.achievements;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.achievement.models.*;
import net.accelbyte.sdk.api.achievement.models.ModelsPublicAchievementsResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * PublicListAchievements
 *
 * 
 * 
 * Required permission `NAMESPACE:{namespace}:ACHIEVEMENT [READ]` and scope
 * `social`
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class PublicListAchievements extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/achievement/v1/public/namespaces/{namespace}/achievements";

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
    private String namespace;
    private Integer limit;
    private Integer offset;
    private String sortBy;
    private String language;

    /**
    * @param namespace required
    * @param language required
    */
    public PublicListAchievements(
            String namespace,
            Integer limit,
            Integer offset,
            String sortBy,
            String language
    )
    {
        this.namespace = namespace;
        this.limit = limit;
        this.offset = offset;
        this.sortBy = sortBy;
        this.language = language;
    }

    @JsonIgnore
    public PublicListAchievements createFromJson(String json) throws JsonProcessingException {
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
        return pathParams;
    }

    @Override
    @JsonIgnore
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
        queryParams.put("language", this.language == null ? null : Arrays.asList(this.language));
        return queryParams;
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
        result.put("limit","limit");
        result.put("offset","offset");
        result.put("sortBy","sortBy");
        result.put("language","language");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",



            "language"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.language == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public ModelsPublicAchievementsResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsPublicAchievementsResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    public Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("limit", "None");
        result.put("offset", "None");
        result.put("sortBy", "None");
        result.put("language", "None");
        return result;
    }
}