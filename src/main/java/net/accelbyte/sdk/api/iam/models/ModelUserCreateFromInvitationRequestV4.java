/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.iam.models;

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
public class ModelUserCreateFromInvitationRequestV4 extends Model {

    @JsonProperty("acceptedPolicies")
    private List<LegalAcceptedPoliciesRequest> acceptedPolicies;

    @JsonProperty("authType")
    private String authType;

    @JsonProperty("country")
    private String country;

    @JsonProperty("dateOfBirth")
    private String dateOfBirth;

    @JsonProperty("displayName")
    private String displayName;

    @JsonProperty("password")
    private String password;

    @JsonProperty("username")
    private String username;

    @JsonIgnore
    public ModelUserCreateFromInvitationRequestV4 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelUserCreateFromInvitationRequestV4> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserCreateFromInvitationRequestV4>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("acceptedPolicies", "acceptedPolicies");
        result.put("authType", "authType");
        result.put("country", "country");
        result.put("dateOfBirth", "dateOfBirth");
        result.put("displayName", "displayName");
        result.put("password", "password");
        result.put("username", "username");
        return result;
    }
}