package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class CategoryInfo extends Model {

    @JsonProperty("categoryPath")
    String categoryPath;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("displayName")
    String displayName;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("parentCategoryPath")
    String parentCategoryPath;
    @JsonProperty("root")
    Boolean root;
    @JsonProperty("updatedAt")
    String updatedAt;

    public CategoryInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("categoryPath", "categoryPath");
        result.put("createdAt", "createdAt");
        result.put("displayName", "displayName");
        result.put("namespace", "namespace");
        result.put("parentCategoryPath", "parentCategoryPath");
        result.put("root", "root");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}