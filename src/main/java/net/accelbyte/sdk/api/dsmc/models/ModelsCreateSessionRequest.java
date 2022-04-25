/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.models;

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
public class ModelsCreateSessionRequest extends Model {

    @JsonProperty("client_version")
    private String clientVersion;

    @JsonProperty("configuration")
    private String configuration;

    @JsonProperty("deployment")
    private String deployment;

    @JsonProperty("game_mode")
    private String gameMode;

    @JsonProperty("matching_allies")
    private List<ModelsRequestMatchingAlly> matchingAllies;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("notification_payload")
    private ModelsMatchResultNotificationPayload notificationPayload;

    @JsonProperty("pod_name")
    private String podName;

    @JsonProperty("region")
    private String region;

    @JsonProperty("session_id")
    private String sessionId;



    @JsonIgnore
    public ModelsCreateSessionRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsCreateSessionRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsCreateSessionRequest>>() {});
    }

    
}