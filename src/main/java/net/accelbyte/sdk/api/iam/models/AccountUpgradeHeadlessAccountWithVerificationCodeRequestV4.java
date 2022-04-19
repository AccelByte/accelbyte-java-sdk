/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
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
public class AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4 extends Model {

    @JsonProperty("code")
    private String code;

    @JsonProperty("country")
    private String country;

    @JsonProperty("dateOfBirth")
    private String dateOfBirth;

    @JsonProperty("displayName")
    private String displayName;

    @JsonProperty("emailAddress")
    private String emailAddress;

    @JsonProperty("password")
    private String password;

    @JsonProperty("reachMinimumAge")
    private Boolean reachMinimumAge;

    @JsonProperty("username")
    private String username;

    @JsonProperty("validateOnly")
    private Boolean validateOnly;

    @JsonIgnore
    public AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("code", "code");
        result.put("country", "country");
        result.put("dateOfBirth", "dateOfBirth");
        result.put("displayName", "displayName");
        result.put("emailAddress", "emailAddress");
        result.put("password", "password");
        result.put("reachMinimumAge", "reachMinimumAge");
        result.put("username", "username");
        result.put("validateOnly", "validateOnly");
        return result;
    }
}