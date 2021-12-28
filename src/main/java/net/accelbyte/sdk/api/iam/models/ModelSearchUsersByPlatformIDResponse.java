package net.accelbyte.sdk.api.iam.models;

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
public class ModelSearchUsersByPlatformIDResponse extends Model {

    @JsonProperty("Data")
    private List<AccountcommonUserSearchByPlatformIDResult> data;

    @JsonProperty("Paging")
    private AccountcommonPagination paging;

    public ModelSearchUsersByPlatformIDResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelSearchUsersByPlatformIDResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelSearchUsersByPlatformIDResponse>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("Data", "data");
        result.put("Paging", "paging");
        return result;
    }
}