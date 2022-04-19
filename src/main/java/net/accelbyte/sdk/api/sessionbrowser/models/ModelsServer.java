/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.models;

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
public class ModelsServer extends Model {

    @JsonProperty("allocation_id")
    private String allocationId;

    @JsonProperty("alternate_ips")
    private List<String> alternateIps;

    @JsonProperty("cpu_limit")
    private Integer cpuLimit;

    @JsonProperty("cpu_request")
    private String cpuRequest;

    @JsonProperty("deployment")
    private String deployment;

    @JsonProperty("game_version")
    private String gameVersion;

    @JsonProperty("image_version")
    private String imageVersion;

    @JsonProperty("ip")
    private String ip;

    @JsonProperty("is_override_game_version")
    private Boolean isOverrideGameVersion;

    @JsonProperty("last_update")
    private String lastUpdate;

    @JsonProperty("mem_limit")
    private Integer memLimit;

    @JsonProperty("mem_request")
    private String memRequest;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("params")
    private String params;

    @JsonProperty("pod_name")
    private String podName;

    @JsonProperty("port")
    private Integer port;

    @JsonProperty("ports")
    private Map<String, Integer> ports;

    @JsonProperty("provider")
    private String provider;

    @JsonProperty("region")
    private String region;

    @JsonProperty("session_id")
    private String sessionId;

    @JsonProperty("status")
    private String status;

    @JsonProperty("status_history")
    private List<ModelsStatusHistory> statusHistory;

    @JsonIgnore
    public ModelsServer createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsServer> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsServer>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("allocation_id", "allocationId");
        result.put("alternate_ips", "alternateIps");
        result.put("cpu_limit", "cpuLimit");
        result.put("cpu_request", "cpuRequest");
        result.put("deployment", "deployment");
        result.put("game_version", "gameVersion");
        result.put("image_version", "imageVersion");
        result.put("ip", "ip");
        result.put("is_override_game_version", "isOverrideGameVersion");
        result.put("last_update", "lastUpdate");
        result.put("mem_limit", "memLimit");
        result.put("mem_request", "memRequest");
        result.put("namespace", "namespace");
        result.put("params", "params");
        result.put("pod_name", "podName");
        result.put("port", "port");
        result.put("ports", "ports");
        result.put("provider", "provider");
        result.put("region", "region");
        result.put("session_id", "sessionId");
        result.put("status", "status");
        result.put("status_history", "statusHistory");
        return result;
    }
}