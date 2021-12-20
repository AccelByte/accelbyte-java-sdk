package net.accelbyte.sdk.api.dsmc.models;

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
public class ModelsDSMConfigExport extends Model {

    @JsonProperty("claim_timeout")
    Integer claimTimeout;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("creation_timeout")
    Integer creationTimeout;
    @JsonProperty("default_version")
    String defaultVersion;
    @JsonProperty("deployments")
    List<ModelsDeploymentWithOverride> deployments;
    @JsonProperty("images")
    List<ModelsImageRecord> images;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("pod_configs")
    List<ModelsPodConfigRecord> podConfigs;
    @JsonProperty("port")
    Integer port;
    @JsonProperty("ports")
    Map<String, Integer> ports;
    @JsonProperty("protocol")
    String protocol;
    @JsonProperty("providers")
    List<String> providers;
    @JsonProperty("session_timeout")
    Integer sessionTimeout;
    @JsonProperty("unreachable_timeout")
    Integer unreachableTimeout;
    @JsonProperty("updatedAt")
    String updatedAt;

    public ModelsDSMConfigExport createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("claim_timeout", "claimTimeout");
        result.put("createdAt", "createdAt");
        result.put("creation_timeout", "creationTimeout");
        result.put("default_version", "defaultVersion");
        result.put("deployments", "deployments");
        result.put("images", "images");
        result.put("namespace", "namespace");
        result.put("pod_configs", "podConfigs");
        result.put("port", "port");
        result.put("ports", "ports");
        result.put("protocol", "protocol");
        result.put("providers", "providers");
        result.put("session_timeout", "sessionTimeout");
        result.put("unreachable_timeout", "unreachableTimeout");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}