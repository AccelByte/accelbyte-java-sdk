/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.gametelemetry.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.*;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TelemetryBody extends Model {

    @JsonProperty("EventId")
    private String eventId;

    @JsonProperty("EventName")
    private String eventName;

    @JsonProperty("EventNamespace")
    private String eventNamespace;

    @JsonProperty("EventTimestamp")
    private String eventTimestamp;

    @JsonProperty("Payload")
    private Map<String, ?> payload;

    @JsonIgnore
    public TelemetryBody createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<TelemetryBody> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<TelemetryBody>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("EventId", "eventId");
        result.put("EventName", "eventName");
        result.put("EventNamespace", "eventNamespace");
        result.put("EventTimestamp", "eventTimestamp");
        result.put("Payload", "payload");
        return result;
    }
}