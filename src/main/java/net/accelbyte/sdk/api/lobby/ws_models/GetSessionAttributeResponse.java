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
public class GetSessionAttributeResponse {
    private String id;
    private String code;
    private String value;

    private GetSessionAttributeResponse() {

    }

    @Builder
    public GetSessionAttributeResponse (
        String id,
        String code,
        String value
    ) {
        this.id = id;
        this.code = code;
        this.value = value;
    }

    public static String getType(){
        return "getSessionAttributeResponse";
    }

    public static GetSessionAttributeResponse createFromWSM(String message) {
        GetSessionAttributeResponse result = new GetSessionAttributeResponse();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.code = response.get("code") != null ? response.get("code") : null;
        result.value = response.get("value") != null ? response.get("value") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(GetSessionAttributeResponse.getType());
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
        if (code != null) {
            stringBuilder
                    .append("\n")
                    .append("code: ")
                    .append(code);
        }
        if (value != null) {
            stringBuilder
                    .append("\n")
                    .append("value: ")
                    .append(value);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("code","code");
        result.put("value","value");
        return result;
    }
}