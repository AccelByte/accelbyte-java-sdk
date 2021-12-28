package net.accelbyte.sdk.api.platform.models;

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
public class KeyInfo extends Model {

    @JsonProperty("acquireOrderNo")
    private String acquireOrderNo;

    @JsonProperty("acquireUserId")
    private String acquireUserId;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("id")
    private String id;

    @JsonProperty("keyFile")
    private String keyFile;

    @JsonProperty("keyGroupId")
    private String keyGroupId;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("status")
    private String status;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("value")
    private String value;

    public KeyInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<KeyInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<KeyInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("acquireOrderNo", "acquireOrderNo");
        result.put("acquireUserId", "acquireUserId");
        result.put("createdAt", "createdAt");
        result.put("id", "id");
        result.put("keyFile", "keyFile");
        result.put("keyGroupId", "keyGroupId");
        result.put("namespace", "namespace");
        result.put("status", "status");
        result.put("updatedAt", "updatedAt");
        result.put("value", "value");
        return result;
    }
}