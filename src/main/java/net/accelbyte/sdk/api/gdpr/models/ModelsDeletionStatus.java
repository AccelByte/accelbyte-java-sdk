/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.models;

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
public class ModelsDeletionStatus extends Model {

  @JsonProperty("DeletionDate")
  private String deletionDate;

  @JsonProperty("DeletionStatus")
  private Boolean deletionStatus;

  @JsonProperty("DisplayName")
  private String displayName;

  @JsonProperty("ExecutionDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String executionDate;

  @JsonProperty("Status")
  private String status;

  @JsonProperty("UserID")
  private String userID;

  @JsonIgnore
  public ModelsDeletionStatus createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsDeletionStatus> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsDeletionStatus>>() {});
  }
}
