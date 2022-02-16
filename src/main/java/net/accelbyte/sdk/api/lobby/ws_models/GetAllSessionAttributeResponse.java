/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

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
public class GetAllSessionAttributeResponse {
    private String id;
    private String code;
    private Map<String, String> attributes;

    private GetAllSessionAttributeResponse() {

    }

    @Builder
    public GetAllSessionAttributeResponse (
        String id,
        String code,
        Map<String, String> attributes
    ) {
        this.id = id;
        this.code = code;
        this.attributes = attributes;
    }

    public static String getType(){
        return "getAllSessionAttributeResponse";
    }

    public static GetAllSessionAttributeResponse createFromWSM(String message) {
        GetAllSessionAttributeResponse result = new GetAllSessionAttributeResponse();
        Map<String, String> response = parseWSM(message);
        result.id = response.get("id") != null ? response.get("id") : null;
        result.code = response.get("code") != null ? response.get("code") : null;
        result.attributes = response.get("attributes") != null ? convertJsonToMap(response.get("attributes")) : null;
        return result;
    }

    public String toWSM() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("type: ").append(GetAllSessionAttributeResponse.getType());
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
        if (attributes != null) {
            try {
                String json = new ObjectMapper().writeValueAsString(attributes);
                stringBuilder
                    .append("\n")
                    .append("attributes: ")
                    .append(json);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
        return stringBuilder.toString();
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id","id");
        result.put("code","code");
        result.put("attributes","attributes");
        return result;
    }
}