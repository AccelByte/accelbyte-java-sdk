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
public class SignalingP2PNotif {
    private String destinationId;
    private String message;

    private SignalingP2PNotif() {

    }

    @Builder
    public SignalingP2PNotif (
        String destinationId,
        String message
    ) {
        this.destinationId = destinationId;
        this.message = message;
    }

    public static String getType(){
        return "signalingP2PNotif";
    }

    public static SignalingP2PNotif createFromWSM(String message) {
        SignalingP2PNotif result = new SignalingP2PNotif();
        Map<String, String> response = parseWSM(message);
        result.destinationId = response.get("destinationId") != null ? response.get("destinationId") : null;
        result.message = response.get("message") != null ? response.get("message") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(SignalingP2PNotif.getType());
        if (destinationId != null) {
            stringBuilder
                    .append("\n")
                    .append("destinationId: ")
                    .append(destinationId);
        }
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
        result.put("destinationId","destinationId");
        result.put("message","message");
        return result;
    }
}