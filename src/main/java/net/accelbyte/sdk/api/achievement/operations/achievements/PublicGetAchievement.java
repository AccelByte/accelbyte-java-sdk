package net.accelbyte.sdk.api.achievement.operations.achievements;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.achievement.models.*;
import net.accelbyte.sdk.api.achievement.models.ModelsPublicAchievementResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Getter
@Setter
public class PublicGetAchievement extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/achievement/v1/public/namespaces/{namespace}/achievements/{achievementCode}";

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
    private String achievementCode;
    private String namespace;
    private String language;

    /**
    * @param achievementCode required
    * @param namespace required
    * @param language required
    */
    public PublicGetAchievement(
            String achievementCode,
            String namespace,
            String language
    )
    {
        this.achievementCode = achievementCode;
        this.namespace = namespace;
        this.language = language;
    }

    public PublicGetAchievement(){
    }

    public PublicGetAchievement createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.achievementCode != null){
            pathParams.put("achievementCode", this.achievementCode);
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
        queryParams.put("language", this.language);
        return queryParams;
    }



    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("achievementCode","achievementCode");
        result.put("namespace","namespace");
        result.put("language","language");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "achievementCode",
            "namespace",
            "language"
        );
    }

    @Override
    public boolean isValid() {
        if(this.achievementCode == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.language == null) {
            return false;
        }
        return true;
    }

    @Override
    public ModelsPublicAchievementResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsPublicAchievementResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }
}
