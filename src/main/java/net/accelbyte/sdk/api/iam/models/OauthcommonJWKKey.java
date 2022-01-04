package net.accelbyte.sdk.api.iam.models;

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
public class OauthcommonJWKKey extends Model {

    @JsonProperty("alg")
    private String alg;

    @JsonProperty("e")
    private String e;

    @JsonProperty("kid")
    private String kid;

    @JsonProperty("kty")
    private String kty;

    @JsonProperty("n")
    private String n;

    @JsonProperty("use")
    private String use;

    @JsonIgnore
    public OauthcommonJWKKey createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<OauthcommonJWKKey> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<OauthcommonJWKKey>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("alg", "alg");
        result.put("e", "e");
        result.put("kid", "kid");
        result.put("kty", "kty");
        result.put("n", "n");
        result.put("use", "use");
        return result;
    }
}