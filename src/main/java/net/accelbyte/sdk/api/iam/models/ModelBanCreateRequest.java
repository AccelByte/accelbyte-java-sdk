package net.accelbyte.sdk.api.iam.models;

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
public class ModelBanCreateRequest extends Model {

    @JsonProperty("ban")
    private String ban;

    @JsonProperty("comment")
    private String comment;

    @JsonProperty("endDate")
    private String endDate;

    @JsonProperty("reason")
    private String reason;

    @JsonProperty("skipNotif")
    private Boolean skipNotif;

    public ModelBanCreateRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelBanCreateRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelBanCreateRequest>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("ban", "ban");
        result.put("comment", "comment");
        result.put("endDate", "endDate");
        result.put("reason", "reason");
        result.put("skipNotif", "skipNotif");
        return result;
    }
}