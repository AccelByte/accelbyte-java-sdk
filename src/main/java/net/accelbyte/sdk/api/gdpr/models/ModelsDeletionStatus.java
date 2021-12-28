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
public class ModelsDeletionStatus extends Model {

    @JsonProperty("DeletionStatus")
    private Boolean deletionStatus;

    @JsonProperty("DisplayName")
    private String displayName;

    @JsonProperty("ExecutionDate")
    private String executionDate;

    @JsonProperty("Status")
    private String status;

    @JsonProperty("UserID")
    private String userID;

    public ModelsDeletionStatus createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsDeletionStatus> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsDeletionStatus>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("DeletionStatus", "deletionStatus");
        result.put("DisplayName", "displayName");
        result.put("ExecutionDate", "executionDate");
        result.put("Status", "status");
        result.put("UserID", "userID");
        return result;
    }
}