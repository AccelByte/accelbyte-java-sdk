/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gametelemetry.models;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class TelemetryBody extends Model {

  @JsonProperty("EventId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String eventId;

  @JsonProperty("EventName")
  private String eventName;

  @JsonProperty("EventNamespace")
  private String eventNamespace;

  @JsonProperty("EventTimestamp")
  @JsonInclude(JsonInclude.Include.NON_NULL)
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
}
