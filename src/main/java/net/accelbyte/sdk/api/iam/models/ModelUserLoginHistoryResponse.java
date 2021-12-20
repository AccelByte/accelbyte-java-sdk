package net.accelbyte.sdk.api.iam.models;

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
public class ModelUserLoginHistoryResponse extends Model {

    @JsonProperty("ApplicationName")
    String applicationName;
    @JsonProperty("City")
    String city;
    @JsonProperty("Country")
    String country;
    @JsonProperty("DeviceId")
    String deviceId;
    @JsonProperty("State")
    String state;
    @JsonProperty("Timestamp")
    Integer timestamp;
    @JsonProperty("deviceName")
    String deviceName;

    public ModelUserLoginHistoryResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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