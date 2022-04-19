/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.*;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserProfileUpdate extends Model {

    @JsonProperty("avatarLargeUrl")
    private String avatarLargeUrl;

    @JsonProperty("avatarSmallUrl")
    private String avatarSmallUrl;

    @JsonProperty("avatarUrl")
    private String avatarUrl;

    @JsonProperty("customAttributes")
    private Map<String, ?> customAttributes;

    @JsonProperty("dateOfBirth")
    private String dateOfBirth;

    @JsonProperty("firstName")
    private String firstName;

    @JsonProperty("language")
    private String language;

    @JsonProperty("lastName")
    private String lastName;

    @JsonProperty("timeZone")
    private String timeZone;

    @JsonProperty("zipCode")
    private String zipCode;

    @JsonIgnore
    public UserProfileUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<UserProfileUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<UserProfileUpdate>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("avatarLargeUrl", "avatarLargeUrl");
        result.put("avatarSmallUrl", "avatarSmallUrl");
        result.put("avatarUrl", "avatarUrl");
        result.put("customAttributes", "customAttributes");
        result.put("dateOfBirth", "dateOfBirth");
        result.put("firstName", "firstName");
        result.put("language", "language");
        result.put("lastName", "lastName");
        result.put("timeZone", "timeZone");
        result.put("zipCode", "zipCode");
        return result;
    }
}