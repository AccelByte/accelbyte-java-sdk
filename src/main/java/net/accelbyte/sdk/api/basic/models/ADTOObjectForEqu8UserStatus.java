package net.accelbyte.sdk.api.basic.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class ADTOObjectForEqu8UserStatus extends Model {

    @JsonProperty("actionComment")
    private String actionComment;

    @JsonProperty("actionId")
    private Integer actionId;

    @JsonProperty("expires")
    private String expires;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("when")
    private String when;

    @JsonIgnore
    public ADTOObjectForEqu8UserStatus createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ADTOObjectForEqu8UserStatus> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ADTOObjectForEqu8UserStatus>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("actionComment", "actionComment");
        result.put("actionId", "actionId");
        result.put("expires", "expires");
        result.put("userId", "userId");
        result.put("when", "when");
        return result;
    }
}