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
public class PaymentCallbackConfigInfo extends Model {

    @JsonProperty("dryRun")
    private Boolean dryRun;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("notifyUrl")
    private String notifyUrl;

    @JsonProperty("privateKey")
    private String privateKey;

    public PaymentCallbackConfigInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<PaymentCallbackConfigInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentCallbackConfigInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("dryRun", "dryRun");
        result.put("namespace", "namespace");
        result.put("notifyUrl", "notifyUrl");
        result.put("privateKey", "privateKey");
        return result;
    }
}