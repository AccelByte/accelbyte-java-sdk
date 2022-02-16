/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

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
public class Image extends Model {

    @JsonProperty("as")
    private String as;

    @JsonProperty("caption")
    private String caption;

    @JsonProperty("height")
    private Integer height;

    @JsonProperty("imageUrl")
    private String imageUrl;

    @JsonProperty("smallImageUrl")
    private String smallImageUrl;

    @JsonProperty("width")
    private Integer width;

    @JsonIgnore
    public Image createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<Image> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<Image>>() {});
    }

    @JsonIgnore
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