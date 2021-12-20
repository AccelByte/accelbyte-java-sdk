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
public class ModelsDataRetrievalResponse extends Model {

    @JsonProperty("Namespace")
    String namespace;
    @JsonProperty("RequestDate")
    String requestDate;
    @JsonProperty("UserID")
    String userID;

    public ModelsDataRetrievalResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("Namespace", "namespace");
        result.put("RequestDate", "requestDate");
        result.put("UserID", "userID");
        return result;
    }
}