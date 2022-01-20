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
public class ClientResetRequest {
    private String userId;
    private String namespace;

    private ClientResetRequest() {

    }

    @Builder
    public ClientResetRequest (
        String userId,
        String namespace
    ) {
        this.userId = userId;
        this.namespace = namespace;
    }

    public static String getType(){
        return "clientResetRequest";
    }

    public static ClientResetRequest createFromWSM(String message) {
        ClientResetRequest result = new ClientResetRequest();
        Map<String, String> response = parseWSM(message);
        result.userId = response.get("userId") != null ? response.get("userId") : null;
        result.namespace = response.get("namespace") != null ? response.get("namespace") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(ClientResetRequest.getType());
        if (userId != null) {
            stringBuilder
                    .append("\n")
                    .append("userId: ")
                    .append(userId);
        }
        if (namespace != null) {
            stringBuilder
                    .append("\n")
                    .append("namespace: ")
                    .append(namespace);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("userId","userId");
        result.put("namespace","namespace");
        return result;
    }
}