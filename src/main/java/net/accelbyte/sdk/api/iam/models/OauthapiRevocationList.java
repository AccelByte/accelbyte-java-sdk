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
public class OauthapiRevocationList extends Model {

    @JsonProperty("revoked_tokens")
    BloomFilterJSON revokedTokens;
    @JsonProperty("revoked_users")
    List<OauthcommonUserRevocationListRecord> revokedUsers;

    public OauthapiRevocationList createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("revoked_tokens", "revokedTokens");
        result.put("revoked_users", "revokedUsers");
        return result;
    }
}