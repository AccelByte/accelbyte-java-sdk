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
public class ModelsPersonalData extends Model {

    @JsonProperty("DataExpirationDate")
    private String dataExpirationDate;

    @JsonProperty("DisplayName")
    private String displayName;

    @JsonProperty("RequestDate")
    private String requestDate;

    @JsonProperty("ServiceErrors")
    private Map<String, String> serviceErrors;

    @JsonProperty("ServiceStatuses")
    private Map<String, String> serviceStatuses;

    @JsonProperty("Status")
    private String status;

    @JsonProperty("UserID")
    private String userID;

    public ModelsPersonalData createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsPersonalData> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsPersonalData>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("DataExpirationDate", "dataExpirationDate");
        result.put("DisplayName", "displayName");
        result.put("RequestDate", "requestDate");
        result.put("ServiceErrors", "serviceErrors");
        result.put("ServiceStatuses", "serviceStatuses");
        result.put("Status", "status");
        result.put("UserID", "userID");
        return result;
    }
}