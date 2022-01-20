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
public class RematchmakingNotif {
    private Integer banDuration;

    private RematchmakingNotif() {

    }

    @Builder
    public RematchmakingNotif (
        Integer banDuration
    ) {
        this.banDuration = banDuration;
    }

    public static String getType(){
        return "rematchmakingNotif";
    }

    public static RematchmakingNotif createFromWSM(String message) {
        RematchmakingNotif result = new RematchmakingNotif();
        Map<String, String> response = parseWSM(message);
        result.banDuration = response.get("banDuration") != null ? Integer.valueOf(response.get("banDuration")) : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(RematchmakingNotif.getType());
        if (banDuration != null) {
            stringBuilder
                    .append("\n")
                    .append("banDuration: ")
                    .append(banDuration);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("banDuration","banDuration");
        return result;
    }
}