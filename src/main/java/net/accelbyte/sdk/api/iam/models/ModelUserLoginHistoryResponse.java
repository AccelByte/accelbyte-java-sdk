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
public class ModelUserLoginHistoryResponse extends Model {

    @JsonProperty("ApplicationName")
    private String applicationName;

    @JsonProperty("City")
    private String city;

    @JsonProperty("Country")
    private String country;

    @JsonProperty("DeviceId")
    private String deviceId;

    @JsonProperty("State")
    private String state;

    @JsonProperty("Timestamp")
    private Integer timestamp;

    @JsonProperty("deviceName")
    private String deviceName;

    public ModelUserLoginHistoryResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelUserLoginHistoryResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserLoginHistoryResponse>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("ApplicationName", "applicationName");
        result.put("City", "city");
        result.put("Country", "country");
        result.put("DeviceId", "deviceId");
        result.put("State", "state");
        result.put("Timestamp", "timestamp");
        result.put("deviceName", "deviceName");
        return result;
    }
}