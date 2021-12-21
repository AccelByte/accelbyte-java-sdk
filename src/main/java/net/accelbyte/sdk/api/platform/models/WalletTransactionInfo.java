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
public class WalletTransactionInfo extends Model {

    @JsonProperty("amount")
    Integer amount;
    @JsonProperty("balanceSource")
    String balanceSource;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("currencyCode")
    String currencyCode;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("operator")
    String operator;
    @JsonProperty("reason")
    String reason;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("walletAction")
    String walletAction;
    @JsonProperty("walletId")
    String walletId;

    public WalletTransactionInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("amount", "amount");
        result.put("balanceSource", "balanceSource");
        result.put("createdAt", "createdAt");
        result.put("currencyCode", "currencyCode");
        result.put("namespace", "namespace");
        result.put("operator", "operator");
        result.put("reason", "reason");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        result.put("walletAction", "walletAction");
        result.put("walletId", "walletId");
        return result;
    }
}