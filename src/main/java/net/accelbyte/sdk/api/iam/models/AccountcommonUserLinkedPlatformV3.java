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
public class AccountcommonUserLinkedPlatformV3 extends Model {

    @JsonProperty("accountGroup")
    private String accountGroup;

    @JsonProperty("displayName")
    private String displayName;

    @JsonProperty("emailAddress")
    private String emailAddress;

    @JsonProperty("linkedAt")
    private String linkedAt;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("originNamespace")
    private String originNamespace;

    @JsonProperty("platformId")
    private String platformId;

    @JsonProperty("platformUserId")
    private String platformUserId;

    @JsonProperty("userId")
    private String userId;



    @JsonIgnore
    public AccountcommonUserLinkedPlatformV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<AccountcommonUserLinkedPlatformV3> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AccountcommonUserLinkedPlatformV3>>() {});
    }

    
}