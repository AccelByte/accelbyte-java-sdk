package net.accelbyte.sdk.api.gdpr.models;

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
public class ModelsUserPersonalData extends Model {

    @JsonProperty("DataExpirationDate")
    String dataExpirationDate;
    @JsonProperty("RequestDate")
    String requestDate;
    @JsonProperty("Status")
    String status;

    public ModelsUserPersonalData createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("DataExpirationDate", "dataExpirationDate");
        result.put("RequestDate", "requestDate");
        result.put("Status", "status");
        return result;
    }
}