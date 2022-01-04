package net.accelbyte.sdk.api.dsmc.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class ModelsDSMConfigExport extends Model {

    @JsonProperty("claim_timeout")
    private Integer claimTimeout;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("creation_timeout")
    private Integer creationTimeout;

    @JsonProperty("default_version")
    private String defaultVersion;

    @JsonProperty("deployments")
    private List<ModelsDeploymentWithOverride> deployments;

    @JsonProperty("images")
    private List<ModelsImageRecord> images;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("pod_configs")
    private List<ModelsPodConfigRecord> podConfigs;

    @JsonProperty("port")
    private Integer port;

    @JsonProperty("ports")
    private Map<String, Integer> ports;

    @JsonProperty("protocol")
    private String protocol;

    @JsonProperty("providers")
    private List<String> providers;

    @JsonProperty("session_timeout")
    private Integer sessionTimeout;

    @JsonProperty("unreachable_timeout")
    private Integer unreachableTimeout;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonIgnore
    public ModelsDSMConfigExport createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsDSMConfigExport> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsDSMConfigExport>>() {});
    }

    @JsonIgnore
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