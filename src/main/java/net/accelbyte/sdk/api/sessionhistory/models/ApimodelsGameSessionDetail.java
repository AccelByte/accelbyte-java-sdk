/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.models;

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
public class ApimodelsGameSessionDetail extends Model {

  @JsonProperty("active")
  private Boolean active;

  @JsonProperty("created_at")
  private String createdAt;

  @JsonProperty("ended")
  private Boolean ended;

  @JsonProperty("histories")
  private List<ApimodelsHistory> histories;

  @JsonProperty("joinability")
  private String joinability;

  @JsonProperty("last_data")
  private ModelsGameSession lastData;

  @JsonProperty("match_pool")
  private String matchPool;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("persistent")
  private Boolean persistent;

  @JsonProperty("pod_name")
  private String podName;

  @JsonProperty("sessionID")
  private String sessionID;

  @JsonProperty("session_template")
  private String sessionTemplate;

  @JsonProperty("updated_at")
  private String updatedAt;

  @JsonIgnore
  public ApimodelsGameSessionDetail createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsGameSessionDetail> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsGameSessionDetail>>() {});
  }
}
