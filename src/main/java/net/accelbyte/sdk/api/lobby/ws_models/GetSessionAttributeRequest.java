package net.accelbyte.sdk.api.lobby.ws_models;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.*;

import static net.accelbyte.sdk.core.util.Helper.*;

@Getter
@Setter
public class GetSessionAttributeRequest {
    private String id;
    private String key;

    private GetSessionAttributeRequest() {

    }

    @Builder
    public GetSessionAttributeRequest (
        String id,
        String key
    ) {
        this.id = id;
        this.key = key;
    }

    public static String getType(){
        return "getSessionAttributeRequest";
    }

    public static GetSessionAttributeRequest createFromWSM(String message) {
        GetSessionAttributeRequest result = new GetSessionAttributeRequest();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.key = response.get("key") != null ? response.get("key") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(GetSessionAttributeRequest.getType());
        if (id != null) {
            stringBuilder
                    .append("\n")
                    .append("id: ")
                    .append(id);
        } else {
            stringBuilder
                    .append("\n")
                    .append("id: ")
                    .append(generateUUID());
        }
        if (key != null) {
            stringBuilder
                    .append("\n")
                    .append("key: ")
                    .append(key);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("key","key");
        return result;
    }
}