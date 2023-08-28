/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

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
public class StreamEvent extends Model {

  @JsonProperty("body")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private StreamEventBody body;

  @JsonProperty("eventDomain")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String eventDomain;

  @JsonProperty("eventSource")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String eventSource;

  @JsonProperty("eventType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String eventType;

  @JsonProperty("eventVersion")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer eventVersion;

  @JsonProperty("id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String id;

  @JsonProperty("timestamp")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String timestamp;

  @JsonIgnore
  public StreamEvent createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<StreamEvent> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<StreamEvent>>() {});
  }
}
