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
public class StartMatchmakingRequest {
    private String id;
    private String gameMode;
    private Integer priority;
    private Map<String, ?> partyAttributes;
    private String tempParty;
    private String extraAttributes;

    private StartMatchmakingRequest() {

    }

    @Builder
    public StartMatchmakingRequest (
        String id,
        String gameMode,
        Integer priority,
        Map<String, ?> partyAttributes,
        String tempParty,
        String extraAttributes
    ) {
        this.id = id;
        this.gameMode = gameMode;
        this.priority = priority;
        this.partyAttributes = partyAttributes;
        this.tempParty = tempParty;
        this.extraAttributes = extraAttributes;
    }

    public static String getType(){
        return "startMatchmakingRequest";
    }

    public static StartMatchmakingRequest createFromWSM(String message) {
        StartMatchmakingRequest result = new StartMatchmakingRequest();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.gameMode = response.get("gameMode") != null ? response.get("gameMode") : null;
        result.priority = response.get("priority") != null ? Integer.valueOf(response.get("priority")) : null;
        result.partyAttributes = response.get("partyAttributes") != null ? convertJsonToMap(response.get("partyAttributes")) : null;
        result.tempParty = response.get("tempParty") != null ? response.get("tempParty") : null;
        result.extraAttributes = response.get("extraAttributes") != null ? response.get("extraAttributes") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(StartMatchmakingRequest.getType());
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
        if (gameMode != null) {
            stringBuilder
                    .append("\n")
                    .append("gameMode: ")
                    .append(gameMode);
        }
        if (priority != null) {
            stringBuilder
                    .append("\n")
                    .append("priority: ")
                    .append(priority);
        }
        if (partyAttributes != null) {
            try {
                String json = new ObjectMapper().writeValueAsString(partyAttributes);
                stringBuilder
                    .append("\n")
                    .append("partyAttributes: ")
                    .append(json);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
        if (tempParty != null) {
            stringBuilder
                    .append("\n")
                    .append("tempParty: ")
                    .append(tempParty);
        }
        if (extraAttributes != null) {
            stringBuilder
                    .append("\n")
                    .append("extraAttributes: ")
                    .append(extraAttributes);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("gameMode","gameMode");
        result.put("priority","priority");
        result.put("partyAttributes","partyAttributes");
        result.put("tempParty","tempParty");
        result.put("extraAttributes","extraAttributes");
        return result;
    }
}