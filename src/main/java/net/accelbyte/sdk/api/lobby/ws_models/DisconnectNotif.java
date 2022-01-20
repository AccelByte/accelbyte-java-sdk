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
public class DisconnectNotif {
    private String namespace;
    private String connectionId;

    private DisconnectNotif() {

    }

    @Builder
    public DisconnectNotif (
        String namespace,
        String connectionId
    ) {
        this.namespace = namespace;
        this.connectionId = connectionId;
    }

    public static String getType(){
        return "disconnectNotif";
    }

    public static DisconnectNotif createFromWSM(String message) {
        DisconnectNotif result = new DisconnectNotif();
        Map<String, String> response = parseWSM(message);
        result.namespace = response.get("namespace") != null ? response.get("namespace") : null;
        result.connectionId = response.get("connectionId") != null ? response.get("connectionId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(DisconnectNotif.getType());
        if (namespace != null) {
            stringBuilder
                    .append("\n")
                    .append("namespace: ")
                    .append(namespace);
        }
        if (connectionId != null) {
            stringBuilder
                    .append("\n")
                    .append("connectionId: ")
                    .append(connectionId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("connectionId","connectionId");
        return result;
    }
}