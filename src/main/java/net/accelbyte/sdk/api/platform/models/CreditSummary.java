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
public class CreditSummary extends Model {

    @JsonProperty("amount")
    Integer amount;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("walletId")
    String walletId;

    public CreditSummary createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("amount", "amount");
        result.put("namespace", "namespace");
        result.put("userId", "userId");
        result.put("walletId", "walletId");
        return result;
    }
}