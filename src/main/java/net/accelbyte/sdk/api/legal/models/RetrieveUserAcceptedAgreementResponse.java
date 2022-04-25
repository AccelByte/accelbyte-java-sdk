/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RetrieveUserAcceptedAgreementResponse extends Model {

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("displayName")
    private String displayName;

    @JsonProperty("email")
    private String email;

    @JsonProperty("id")
    private String id;

    @JsonProperty("isAccepted")
    private Boolean isAccepted;

    @JsonProperty("localizedPolicyVersion")
    private LocalizedPolicyVersionObject localizedPolicyVersion;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("policyName")
    private String policyName;

    @JsonProperty("policyType")
    private String policyType;

    @JsonProperty("publisherUserId")
    private String publisherUserId;

    @JsonProperty("signingDate")
    private String signingDate;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("username")
    private String username;



    @JsonIgnore
    public RetrieveUserAcceptedAgreementResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<RetrieveUserAcceptedAgreementResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RetrieveUserAcceptedAgreementResponse>>() {});
    }

    
}