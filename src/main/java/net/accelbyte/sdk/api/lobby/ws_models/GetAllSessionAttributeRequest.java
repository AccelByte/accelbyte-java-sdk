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
public class GetAllSessionAttributeRequest {
    private String id;

    private GetAllSessionAttributeRequest() {

    }

    @Builder
    public GetAllSessionAttributeRequest (
        String id
    ) {
        this.id = id;
    }

    public static String getType(){
        return "getAllSessionAttributeRequest";
    }

    public static GetAllSessionAttributeRequest createFromWSM(String message) {
        GetAllSessionAttributeRequest result = new GetAllSessionAttributeRequest();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(GetAllSessionAttributeRequest.getType());
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
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        return result;
    }
}