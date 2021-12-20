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
public class ModelPublicUserInformationV3 extends Model {

    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("displayName")
    String displayName;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("userName")
    String userName;

    public ModelPublicUserInformationV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("displayName", "displayName");
        result.put("namespace", "namespace");
        result.put("userId", "userId");
        result.put("userName", "userName");
        return result;
    }
}