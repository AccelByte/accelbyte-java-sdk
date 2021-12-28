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
public class ModelsListPodConfigResponse extends Model {

    @JsonProperty("paging")
    ModelsPagingCursor paging;
    @JsonProperty("pod_configs")
    List<ModelsPodConfigRecord> podConfigs;

    public ModelsListPodConfigResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("paging", "paging");
        result.put("pod_configs", "podConfigs");
        return result;
    }
}