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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelVerificationCodeResponse extends Model {

    @JsonProperty("accountRegistration")
    private String accountRegistration;

    @JsonProperty("accountUpgrade")
    private String accountUpgrade;

    @JsonProperty("passwordReset")
    private String passwordReset;

    @JsonProperty("updateEmail")
    private String updateEmail;



    @JsonIgnore
    public ModelVerificationCodeResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelVerificationCodeResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelVerificationCodeResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("accountRegistration", "accountRegistration");
        result.put("accountUpgrade", "accountUpgrade");
        result.put("passwordReset", "passwordReset");
        result.put("updateEmail", "updateEmail");
        return result;
    }
    
    public static class ModelVerificationCodeResponseBuilder {
        
    }
}