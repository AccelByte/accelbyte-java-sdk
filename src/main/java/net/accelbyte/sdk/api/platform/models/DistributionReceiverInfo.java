package net.accelbyte.sdk.api.platform.models;

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
public class DistributionReceiverInfo extends Model {

    @JsonProperty("attributes")
    Map<String, String> attributes;
    @JsonProperty("extUserId")
    String extUserId;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("userId")
    String userId;

    public DistributionReceiverInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("attributes", "attributes");
        result.put("extUserId", "extUserId");
        result.put("namespace", "namespace");
        result.put("userId", "userId");
        return result;
    }
}