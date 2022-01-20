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
public class BlockPlayerRequest {
    private String id;
    private String namespace;
    private String blockUserId;

    private BlockPlayerRequest() {

    }

    @Builder
    public BlockPlayerRequest (
        String id,
        String namespace,
        String blockUserId
    ) {
        this.id = id;
        this.namespace = namespace;
        this.blockUserId = blockUserId;
    }

    public static String getType(){
        return "blockPlayerRequest";
    }

    public static BlockPlayerRequest createFromWSM(String message) {
        BlockPlayerRequest result = new BlockPlayerRequest();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.namespace = response.get("namespace") != null ? response.get("namespace") : null;
        result.blockUserId = response.get("blockUserId") != null ? response.get("blockUserId") : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(BlockPlayerRequest.getType());
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
        if (namespace != null) {
            stringBuilder
                    .append("\n")
                    .append("namespace: ")
                    .append(namespace);
        }
        if (blockUserId != null) {
            stringBuilder
                    .append("\n")
                    .append("blockUserId: ")
                    .append(blockUserId);
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("namespace","namespace");
        result.put("blockUserId","blockUserId");
        return result;
    }
}