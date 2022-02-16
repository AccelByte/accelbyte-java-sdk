/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.seasonpass.models;

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
public class PassUpdate extends Model {

    @JsonProperty("autoEnroll")
    private Boolean autoEnroll;

    @JsonProperty("displayOrder")
    private Integer displayOrder;

    @JsonProperty("images")
    private List<Image> images;

    @JsonProperty("localizations")
    private Map<String, Localization> localizations;

    @JsonProperty("passItemId")
    private String passItemId;

    @JsonIgnore
    public PassUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<PassUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PassUpdate>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("autoEnroll", "autoEnroll");
        result.put("displayOrder", "displayOrder");
        result.put("images", "images");
        result.put("localizations", "localizations");
        result.put("passItemId", "passItemId");
        return result;
    }
}