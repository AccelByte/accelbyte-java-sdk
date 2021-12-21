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
public class XblIAPConfigInfo extends Model {

    @JsonProperty("businessPartnerCertFileName")
    String businessPartnerCertFileName;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("password")
    String password;
    @JsonProperty("relyingPartyCert")
    String relyingPartyCert;

    public XblIAPConfigInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("businessPartnerCertFileName", "businessPartnerCertFileName");
        result.put("namespace", "namespace");
        result.put("password", "password");
        result.put("relyingPartyCert", "relyingPartyCert");
        return result;
    }
}