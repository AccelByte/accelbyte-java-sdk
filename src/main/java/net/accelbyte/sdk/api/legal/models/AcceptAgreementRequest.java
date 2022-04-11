/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.legal.models;

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
public class AcceptAgreementRequest extends Model {

    @JsonProperty("isAccepted")
    private Boolean isAccepted;

    @JsonProperty("isNeedToSendEventMarketing")
    private Boolean isNeedToSendEventMarketing;

    @JsonProperty("localizedPolicyVersionId")
    private String localizedPolicyVersionId;

    @JsonProperty("policyId")
    private String policyId;

    @JsonProperty("policyVersionId")
    private String policyVersionId;

    @JsonIgnore
    public AcceptAgreementRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<AcceptAgreementRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AcceptAgreementRequest>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("isAccepted", "isAccepted");
        result.put("isNeedToSendEventMarketing", "isNeedToSendEventMarketing");
        result.put("localizedPolicyVersionId", "localizedPolicyVersionId");
        result.put("policyId", "policyId");
        result.put("policyVersionId", "policyVersionId");
        return result;
    }
}