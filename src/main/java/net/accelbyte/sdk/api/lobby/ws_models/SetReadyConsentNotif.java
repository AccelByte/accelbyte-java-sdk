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
public class SetReadyConsentNotif {
    private String matchId;
    private String userId;

    private SetReadyConsentNotif() {

    }

    @Builder
    public SetReadyConsentNotif (
        String matchId,
        String userId
    ) {
        this.matchId = matchId;
        this.userId = userId;
    }

    public static String getType(){
        return "setReadyConsentNotif";
    }

    public static SetReadyConsentNotif createFromWSM(String message) {
        SetReadyConsentNotif result = new SetReadyConsentNotif();
        Map<String, String> response = parseWSM(message);
        result.matchId = response.get("matchId") != null ? response.get("matchId") : null;
        result.userId = response.get("userId") != null ? response.get("userId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(SetReadyConsentNotif.getType());
        if (matchId != null) {
            stringBuilder
                    .append("\n")
                    .append("matchId: ")
                    .append(matchId);
        }
        if (userId != null) {
            stringBuilder
                    .append("\n")
                    .append("userId: ")
                    .append(userId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("matchId","matchId");
        result.put("userId","userId");
        return result;
    }
}