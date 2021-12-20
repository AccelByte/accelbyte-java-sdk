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
public class BloomFilterJSON extends Model {

    @JsonProperty("bits")
    List<Integer> bits;
    @JsonProperty("k")
    Integer k;
    @JsonProperty("m")
    Integer m;

    public BloomFilterJSON createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("bits", "bits");
        result.put("k", "k");
        result.put("m", "m");
        return result;
    }
}