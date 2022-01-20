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
public class UserBannedNotification {

    public UserBannedNotification() {

    }


    public static String getType(){
        return "userBannedNotification";
    }

    public static UserBannedNotification createFromWSM(String message) {
        UserBannedNotification result = new UserBannedNotification();
        Map<String, String> response = parseWSM(message);
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(UserBannedNotification.getType());
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        return result;
    }
}