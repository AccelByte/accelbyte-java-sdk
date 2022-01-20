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
public class ConnectNotif {
    private String lobbySessionId;

    private ConnectNotif() {

    }

    @Builder
    public ConnectNotif (
        String lobbySessionId
    ) {
        this.lobbySessionId = lobbySessionId;
    }

    public static String getType(){
        return "connectNotif";
    }

    public static ConnectNotif createFromWSM(String message) {
        ConnectNotif result = new ConnectNotif();
        Map<String, String> response = parseWSM(message);
        result.lobbySessionId = response.get("lobbySessionId") != null ? response.get("lobbySessionId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(ConnectNotif.getType());
        if (lobbySessionId != null) {
            stringBuilder
                    .append("\n")
                    .append("lobbySessionId: ")
                    .append(lobbySessionId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("lobbySessionId","lobbySessionId");
        return result;
    }
}