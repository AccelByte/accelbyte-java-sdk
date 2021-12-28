package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class BasicCategoryInfo extends Model {

    @JsonProperty("categoryPath")
    private String categoryPath;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("parentCategoryPath")
    private String parentCategoryPath;

    @JsonProperty("root")
    private Boolean root;

    @JsonProperty("updatedAt")
    private String updatedAt;

    public BasicCategoryInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<BasicCategoryInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<BasicCategoryInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("categoryPath", "categoryPath");
        result.put("createdAt", "createdAt");
        result.put("namespace", "namespace");
        result.put("parentCategoryPath", "parentCategoryPath");
        result.put("root", "root");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}