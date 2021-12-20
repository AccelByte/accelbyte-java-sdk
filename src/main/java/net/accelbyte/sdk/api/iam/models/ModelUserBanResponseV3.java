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
public class ModelUserBanResponseV3 extends Model {

    @JsonProperty("ban")
    String ban;
    @JsonProperty("banId")
    String banId;
    @JsonProperty("bannedBy")
    AccountcommonBannedByV3 bannedBy;
    @JsonProperty("comment")
    String comment;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("disabledDate")
    String disabledDate;
    @JsonProperty("enabled")
    Boolean enabled;
    @JsonProperty("endDate")
    String endDate;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("reason")
    String reason;
    @JsonProperty("userId")
    String userId;

    public ModelUserBanResponseV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("ban", "ban");
        result.put("banId", "banId");
        result.put("bannedBy", "bannedBy");
        result.put("comment", "comment");
        result.put("createdAt", "createdAt");
        result.put("disabledDate", "disabledDate");
        result.put("enabled", "enabled");
        result.put("endDate", "endDate");
        result.put("namespace", "namespace");
        result.put("reason", "reason");
        result.put("userId", "userId");
        return result;
    }
}