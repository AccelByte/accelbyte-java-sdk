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
public class StoreBackupInfo extends Model {

    @JsonProperty("autoBackup")
    Boolean autoBackup;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("id")
    String id;
    @JsonProperty("name")
    String name;
    @JsonProperty("storeId")
    String storeId;
    @JsonProperty("updatedAt")
    String updatedAt;

    public StoreBackupInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("autoBackup", "autoBackup");
        result.put("createdAt", "createdAt");
        result.put("id", "id");
        result.put("name", "name");
        result.put("storeId", "storeId");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}