package net.accelbyte.sdk.api.sessionbrowser.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class ModelsServer extends Model {

    @JsonProperty("allocation_id")
    String allocationId;
    @JsonProperty("alternate_ips")
    List<String> alternateIps;
    @JsonProperty("cpu_limit")
    Integer cpuLimit;
    @JsonProperty("cpu_request")
    String cpuRequest;
    @JsonProperty("deployment")
    String deployment;
    @JsonProperty("game_version")
    String gameVersion;
    @JsonProperty("image_version")
    String imageVersion;
    @JsonProperty("ip")
    String ip;
    @JsonProperty("is_override_game_version")
    Boolean isOverrideGameVersion;
    @JsonProperty("last_update")
    String lastUpdate;
    @JsonProperty("mem_limit")
    Integer memLimit;
    @JsonProperty("mem_request")
    String memRequest;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("params")
    String params;
    @JsonProperty("pod_name")
    String podName;
    @JsonProperty("port")
    Integer port;
    @JsonProperty("ports")
    Map<String, Integer> ports;
    @JsonProperty("provider")
    String provider;
    @JsonProperty("region")
    String region;
    @JsonProperty("session_id")
    String sessionId;
    @JsonProperty("status")
    String status;
    @JsonProperty("status_history")
    List<ModelsStatusHistory> statusHistory;

    public ModelsServer createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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