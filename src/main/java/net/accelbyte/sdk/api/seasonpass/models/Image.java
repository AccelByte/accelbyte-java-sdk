package net.accelbyte.sdk.api.seasonpass.models;

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
public class Image extends Model {

    @JsonProperty("as")
    String as;
    @JsonProperty("caption")
    String caption;
    @JsonProperty("height")
    Integer height;
    @JsonProperty("width")
    Integer width;
    @JsonProperty("imageUrl")
    String imageUrl;
    @JsonProperty("smallImageUrl")
    String smallImageUrl;

    public Image createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("as", "as");
        result.put("caption", "caption");
        result.put("height", "height");
        result.put("width", "width");
        result.put("imageUrl", "imageUrl");
        result.put("smallImageUrl", "smallImageUrl");
        return result;
    }
}