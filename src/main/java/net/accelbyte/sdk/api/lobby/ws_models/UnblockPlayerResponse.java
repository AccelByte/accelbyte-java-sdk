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
public class UnblockPlayerResponse {
    private String id;
    private String code;
    private String namespace;
    private String unblockedUserId;

    private UnblockPlayerResponse() {

    }

    @Builder
    public UnblockPlayerResponse (
        String id,
        String code,
        String namespace,
        String unblockedUserId
    ) {
        this.id = id;
        this.code = code;
        this.namespace = namespace;
        this.unblockedUserId = unblockedUserId;
    }

    public static String getType(){
        return "unblockPlayerResponse";
    }

    public static UnblockPlayerResponse createFromWSM(String message) {
        UnblockPlayerResponse result = new UnblockPlayerResponse();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.code = response.get("code") != null ? response.get("code") : null;
        result.namespace = response.get("namespace") != null ? response.get("namespace") : null;
        result.unblockedUserId = response.get("unblockedUserId") != null ? response.get("unblockedUserId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(UnblockPlayerResponse.getType());
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
        if (code != null) {
            stringBuilder
                    .append("\n")
                    .append("code: ")
                    .append(code);
        }
        if (namespace != null) {
            stringBuilder
                    .append("\n")
                    .append("namespace: ")
                    .append(namespace);
        }
        if (unblockedUserId != null) {
            stringBuilder
                    .append("\n")
                    .append("unblockedUserId: ")
                    .append(unblockedUserId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("code","code");
        result.put("namespace","namespace");
        result.put("unblockedUserId","unblockedUserId");
        return result;
    }
}