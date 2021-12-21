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
public class KeyInfo extends Model {

    @JsonProperty("acquireOrderNo")
    String acquireOrderNo;
    @JsonProperty("acquireUserId")
    String acquireUserId;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("id")
    String id;
    @JsonProperty("keyFile")
    String keyFile;
    @JsonProperty("keyGroupId")
    String keyGroupId;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("status")
    String status;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("value")
    String value;

    public KeyInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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