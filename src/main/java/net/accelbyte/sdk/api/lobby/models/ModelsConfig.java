package net.accelbyte.sdk.api.lobby.models;

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
public class ModelsConfig extends Model {

    @JsonProperty("autoKickOnDisconnect")
    Boolean autoKickOnDisconnect;
    @JsonProperty("autoKickOnDisconnectDelay")
    Integer autoKickOnDisconnectDelay;
    @JsonProperty("cancelTicketOnDisconnect")
    Boolean cancelTicketOnDisconnect;
    @JsonProperty("chatRateLimitBurst")
    Integer chatRateLimitBurst;
    @JsonProperty("chatRateLimitDuration")
    Integer chatRateLimitDuration;
    @JsonProperty("concurrentUsersLimit")
    Integer concurrentUsersLimit;
    @JsonProperty("enableChat")
    Boolean enableChat;
    @JsonProperty("entitlementCheck")
    Boolean entitlementCheck;
    @JsonProperty("entitlementItemID")
    String entitlementItemID;
    @JsonProperty("generalRateLimitBurst")
    Integer generalRateLimitBurst;
    @JsonProperty("generalRateLimitDuration")
    Integer generalRateLimitDuration;
    @JsonProperty("maxPartyMember")
    Integer maxPartyMember;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("profanityFilter")
    Boolean profanityFilter;
    @JsonProperty("readyConsentTimeout")
    Integer readyConsentTimeout;

    public ModelsConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("autoKickOnDisconnect", "autoKickOnDisconnect");
        result.put("autoKickOnDisconnectDelay", "autoKickOnDisconnectDelay");
        result.put("cancelTicketOnDisconnect", "cancelTicketOnDisconnect");
        result.put("chatRateLimitBurst", "chatRateLimitBurst");
        result.put("chatRateLimitDuration", "chatRateLimitDuration");
        result.put("concurrentUsersLimit", "concurrentUsersLimit");
        result.put("enableChat", "enableChat");
        result.put("entitlementCheck", "entitlementCheck");
        result.put("entitlementItemID", "entitlementItemID");
        result.put("generalRateLimitBurst", "generalRateLimitBurst");
        result.put("generalRateLimitDuration", "generalRateLimitDuration");
        result.put("maxPartyMember", "maxPartyMember");
        result.put("namespace", "namespace");
        result.put("profanityFilter", "profanityFilter");
        result.put("readyConsentTimeout", "readyConsentTimeout");
        return result;
    }
}