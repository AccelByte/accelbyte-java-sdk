/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.eventlog.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.*;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelsGenericQueryPayload extends Model {

    @JsonProperty("clientId")
    private String clientId;

    @JsonProperty("eventName")
    private String eventName;

    @JsonProperty("payloadQuery")
    private Map<String, ?> payloadQuery;

    @JsonProperty("sessionId")
    private String sessionId;

    @JsonProperty("traceId")
    private String traceId;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("version")
    private Integer version;



    @JsonIgnore
    public ModelsGenericQueryPayload createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsGenericQueryPayload> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsGenericQueryPayload>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("clientId", "clientId");
        result.put("eventName", "eventName");
        result.put("payloadQuery", "payloadQuery");
        result.put("sessionId", "sessionId");
        result.put("traceId", "traceId");
        result.put("userId", "userId");
        result.put("version", "version");
        return result;
    }
    
    public static class ModelsGenericQueryPayloadBuilder {
        
    }
}