package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class XblIAPConfigInfo extends Model {

    @JsonProperty("businessPartnerCertFileName")
    private String businessPartnerCertFileName;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("password")
    private String password;

    @JsonProperty("relyingPartyCert")
    private String relyingPartyCert;

    @JsonIgnore
    public XblIAPConfigInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<XblIAPConfigInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<XblIAPConfigInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("businessPartnerCertFileName", "businessPartnerCertFileName");
        result.put("namespace", "namespace");
        result.put("password", "password");
        result.put("relyingPartyCert", "relyingPartyCert");
        return result;
    }
}