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
public class WalletInfo extends Model {

    @JsonProperty("balance")
    Integer balance;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("currencyCode")
    String currencyCode;
    @JsonProperty("currencySymbol")
    String currencySymbol;
    @JsonProperty("id")
    String id;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("status")
    String status;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("userId")
    String userId;

    public WalletInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("balance", "balance");
        result.put("createdAt", "createdAt");
        result.put("currencyCode", "currencyCode");
        result.put("currencySymbol", "currencySymbol");
        result.put("id", "id");
        result.put("namespace", "namespace");
        result.put("status", "status");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
}