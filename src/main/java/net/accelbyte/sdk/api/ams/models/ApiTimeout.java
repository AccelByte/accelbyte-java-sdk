/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.models;

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
public class ApiTimeout extends Model {

  @JsonProperty("claim")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long claim;

  @JsonProperty("creation")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long creation;

  @JsonProperty("drain")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long drain;

  @JsonProperty("session")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long session;

  @JsonProperty("unresponsive")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long unresponsive;

  @JsonIgnore
  public ApiTimeout createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApiTimeout> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApiTimeout>>() {});
  }
}
