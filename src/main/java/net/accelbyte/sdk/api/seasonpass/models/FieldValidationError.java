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
public class FieldValidationError extends Model {

    @JsonProperty("errorCode")
    private String errorCode;

    @JsonProperty("errorField")
    private String errorField;

    @JsonProperty("errorMessage")
    private String errorMessage;

    @JsonProperty("errorValue")
    private String errorValue;

    @JsonProperty("messageVariables")
    private Map<String, String> messageVariables;

    @JsonIgnore
    public FieldValidationError createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<FieldValidationError> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<FieldValidationError>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("errorCode", "errorCode");
        result.put("errorField", "errorField");
        result.put("errorMessage", "errorMessage");
        result.put("errorValue", "errorValue");
        result.put("messageVariables", "messageVariables");
        return result;
    }
}