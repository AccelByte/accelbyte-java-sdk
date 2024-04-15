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
public class ApimodelsEventMatchHistory extends Model {

  @JsonProperty("action")
  private String action;

  @JsonProperty("match")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsMatch match;

  @JsonProperty("matchID")
  private String matchID;

  @JsonProperty("matchpool")
  private String matchpool;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("podName")
  private String podName;

  @JsonProperty("ruleSet")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String ruleSet;

  @JsonProperty("tickID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String tickID;

  @JsonProperty("timestamp")
  private String timestamp;

  @JsonIgnore
  public ApimodelsEventMatchHistory createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsEventMatchHistory> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsEventMatchHistory>>() {});
  }
}
