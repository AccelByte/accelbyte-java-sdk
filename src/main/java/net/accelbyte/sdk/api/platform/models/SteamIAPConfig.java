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
public class SteamIAPConfig extends Model {

    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("publisherAuthenticationKey")
    String publisherAuthenticationKey;
    @JsonProperty("rvn")
    Integer rvn;
    @JsonProperty("updatedAt")
    String updatedAt;

    public SteamIAPConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("namespace", "namespace");
        result.put("publisherAuthenticationKey", "publisherAuthenticationKey");
        result.put("rvn", "rvn");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}