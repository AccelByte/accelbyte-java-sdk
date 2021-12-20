package net.accelbyte.sdk.api.legal.models;

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
public class AcceptAgreementResponse extends Model {

    @JsonProperty("comply")
    Boolean comply;
    @JsonProperty("ext")
    Map<String, ?> ext;
    @JsonProperty("proceed")
    Boolean proceed;

    public AcceptAgreementResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("comply", "comply");
        result.put("ext", "ext");
        result.put("proceed", "proceed");
        return result;
    }
}