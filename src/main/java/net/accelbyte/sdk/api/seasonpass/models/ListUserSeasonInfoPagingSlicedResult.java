package net.accelbyte.sdk.api.seasonpass.models;

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
public class ListUserSeasonInfoPagingSlicedResult extends Model {

    @JsonProperty("data")
    private List<ListUserSeasonInfo> data;

    @JsonProperty("paging")
    private Paging paging;

    @JsonProperty("total")
    private Integer total;

    public ListUserSeasonInfoPagingSlicedResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ListUserSeasonInfoPagingSlicedResult> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ListUserSeasonInfoPagingSlicedResult>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("data", "data");
        result.put("paging", "paging");
        result.put("total", "total");
        return result;
    }
}