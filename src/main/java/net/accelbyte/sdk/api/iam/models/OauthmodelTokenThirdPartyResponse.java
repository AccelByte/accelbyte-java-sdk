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
public class OauthmodelTokenThirdPartyResponse extends Model {

    @JsonProperty("platform_token")
    String platformToken;
    @JsonProperty("sand_box_id")
    String sandBoxId;

    public OauthmodelTokenThirdPartyResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("platform_token", "platformToken");
        result.put("sand_box_id", "sandBoxId");
        return result;
    }
}