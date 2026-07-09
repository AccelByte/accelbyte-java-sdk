/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.models;

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
public class ApimodelAppStatusProgressStep extends Model {

  @JsonProperty("finished_at")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String finishedAt;

  @JsonProperty("started_at")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String startedAt;

  @JsonProperty("status")
  private String status;

  @JsonProperty("status_message")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String statusMessage;

  @JsonProperty("step")
  private String step;

  @JsonProperty("step_order")
  private Integer stepOrder;

  @JsonIgnore
  public ApimodelAppStatusProgressStep createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelAppStatusProgressStep> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelAppStatusProgressStep>>() {});
  }
}
