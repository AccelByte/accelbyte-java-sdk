package net.accelbyte.sdk.api.legal.models;

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
public class PolicyVersionObject extends Model {

    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("description")
    String description;
    @JsonProperty("displayVersion")
    String displayVersion;
    @JsonProperty("id")
    String id;
    @JsonProperty("isCommitted")
    Boolean isCommitted;
    @JsonProperty("isInEffect")
    Boolean isInEffect;
    @JsonProperty("publishedDate")
    String publishedDate;
    @JsonProperty("status")
    String status;
    @JsonProperty("updatedAt")
    String updatedAt;

    public PolicyVersionObject createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("description", "description");
        result.put("displayVersion", "displayVersion");
        result.put("id", "id");
        result.put("isCommitted", "isCommitted");
        result.put("isInEffect", "isInEffect");
        result.put("publishedDate", "publishedDate");
        result.put("status", "status");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}