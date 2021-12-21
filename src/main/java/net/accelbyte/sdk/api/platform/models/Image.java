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
public class Image extends Model {

    @JsonProperty("as")
    String as;
    @JsonProperty("caption")
    String caption;
    @JsonProperty("height")
    Integer height;
    @JsonProperty("imageUrl")
    String imageUrl;
    @JsonProperty("smallImageUrl")
    String smallImageUrl;
    @JsonProperty("width")
    Integer width;

    public Image createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("as", "as");
        result.put("caption", "caption");
        result.put("height", "height");
        result.put("imageUrl", "imageUrl");
        result.put("smallImageUrl", "smallImageUrl");
        result.put("width", "width");
        return result;
    }
}