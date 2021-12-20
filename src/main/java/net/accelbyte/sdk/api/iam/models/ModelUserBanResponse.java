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
public class ModelUserBanResponse extends Model {

    @JsonProperty("Ban")
    String ban;
    @JsonProperty("BanId")
    String banId;
    @JsonProperty("BannedBy")
    BannedBy bannedBy;
    @JsonProperty("Comment")
    String comment;
    @JsonProperty("CreatedAt")
    String createdAt;
    @JsonProperty("DisabledDate")
    String disabledDate;
    @JsonProperty("Enabled")
    Boolean enabled;
    @JsonProperty("EndDate")
    String endDate;
    @JsonProperty("Namespace")
    String namespace;
    @JsonProperty("Reason")
    String reason;
    @JsonProperty("UserId")
    String userId;

    public ModelUserBanResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("Ban", "ban");
        result.put("BanId", "banId");
        result.put("BannedBy", "bannedBy");
        result.put("Comment", "comment");
        result.put("CreatedAt", "createdAt");
        result.put("DisabledDate", "disabledDate");
        result.put("Enabled", "enabled");
        result.put("EndDate", "endDate");
        result.put("Namespace", "namespace");
        result.put("Reason", "reason");
        result.put("UserId", "userId");
        return result;
    }
}