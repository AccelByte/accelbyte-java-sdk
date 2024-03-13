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
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class GetNamespaceEventResponse extends Model {

  @JsonProperty("EventId")
  private String eventId;

  @JsonProperty("EventName")
  private String eventName;

  @JsonProperty("EventNamespace")
  private String eventNamespace;

  @JsonProperty("EventTimeStamp")
  private String eventTimeStamp;

  @JsonProperty("FlightId")
  private String flightId;

  @JsonProperty("Payload")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> payload;

  @JsonProperty("UserId")
  private String userId;

  @JsonProperty("UserNamespace")
  private String userNamespace;

  @JsonIgnore
  public GetNamespaceEventResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<GetNamespaceEventResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<GetNamespaceEventResponse>>() {});
  }
}
