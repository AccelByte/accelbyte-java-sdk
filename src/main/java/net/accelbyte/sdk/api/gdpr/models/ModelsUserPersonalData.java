package net.accelbyte.sdk.api.gdpr.models;

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
public class ModelsUserPersonalData extends Model {

    @JsonProperty("DataExpirationDate")
    private String dataExpirationDate;

    @JsonProperty("RequestDate")
    private String requestDate;

    @JsonProperty("Status")
    private String status;

    public ModelsUserPersonalData createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsUserPersonalData> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsUserPersonalData>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("DataExpirationDate", "dataExpirationDate");
        result.put("RequestDate", "requestDate");
        result.put("Status", "status");
        return result;
    }
}