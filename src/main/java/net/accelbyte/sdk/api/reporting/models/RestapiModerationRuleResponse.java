/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.models;

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
public class RestapiModerationRuleResponse extends Model {

  @JsonProperty("action")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String action;

  @JsonProperty("actions")
  private RestapiModerationRuleActionsResponse actions;

  @JsonProperty("active")
  private Boolean active;

  @JsonProperty("category")
  private String category;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("extensionCategory")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String extensionCategory;

  @JsonProperty("id")
  private String id;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("reason")
  private String reason;

  @JsonProperty("threshold")
  private Integer threshold;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonIgnore
  public RestapiModerationRuleResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RestapiModerationRuleResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<RestapiModerationRuleResponse>>() {});
  }
}
