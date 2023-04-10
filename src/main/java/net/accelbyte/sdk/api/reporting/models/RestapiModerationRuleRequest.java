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
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class RestapiModerationRuleRequest extends Model {

  @JsonProperty("action")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String action;

  @JsonProperty("actions")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private RestapiModerationRuleActionsRequest actions;

  @JsonProperty("active")
  private Boolean active;

  @JsonProperty("category")
  private String category;

  @JsonProperty("extensionCategory")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String extensionCategory;

  @JsonProperty("reason")
  private String reason;

  @JsonProperty("threshold")
  private Integer threshold;

  @JsonIgnore
  public String getAction() {
    return this.action;
  }

  @JsonIgnore
  public Action getActionAsEnum() {
    return Action.valueOf(this.action);
  }

  @JsonIgnore
  public void setAction(final String action) {
    this.action = action;
  }

  @JsonIgnore
  public void setActionFromEnum(final Action action) {
    this.action = action.toString();
  }

  @JsonIgnore
  public String getCategory() {
    return this.category;
  }

  @JsonIgnore
  public Category getCategoryAsEnum() {
    return Category.valueOf(this.category);
  }

  @JsonIgnore
  public void setCategory(final String category) {
    this.category = category;
  }

  @JsonIgnore
  public void setCategoryFromEnum(final Category category) {
    this.category = category.toString();
  }

  @JsonIgnore
  public RestapiModerationRuleRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RestapiModerationRuleRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<RestapiModerationRuleRequest>>() {});
  }

  public enum Action {
    HideContent("HideContent");

    private String value;

    Action(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Category {
    CHAT("CHAT"),
    EXTENSION("EXTENSION"),
    UGC("UGC"),
    USER("USER");

    private String value;

    Category(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class RestapiModerationRuleRequestBuilder {
    private String action;
    private String category;

    public RestapiModerationRuleRequestBuilder action(final String action) {
      this.action = action;
      return this;
    }

    public RestapiModerationRuleRequestBuilder actionFromEnum(final Action action) {
      this.action = action.toString();
      return this;
    }

    public RestapiModerationRuleRequestBuilder category(final String category) {
      this.category = category;
      return this;
    }

    public RestapiModerationRuleRequestBuilder categoryFromEnum(final Category category) {
      this.category = category.toString();
      return this;
    }
  }
}
