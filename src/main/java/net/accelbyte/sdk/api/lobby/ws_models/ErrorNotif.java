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
public class ErrorNotif {
    private String message;

    private ErrorNotif() {

    }

    @Builder
    public ErrorNotif (
        String message
    ) {
        this.message = message;
    }

    public static String getType(){
        return "errorNotif";
    }

    public static ErrorNotif createFromWSM(String message) {
        ErrorNotif result = new ErrorNotif();
        Map<String, String> response = parseWSM(message);
        result.message = response.get("message") != null ? response.get("message") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(ErrorNotif.getType());
        if (message != null) {
            stringBuilder
                    .append("\n")
                    .append("message: ")
                    .append(message);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("message","message");
        return result;
    }
}