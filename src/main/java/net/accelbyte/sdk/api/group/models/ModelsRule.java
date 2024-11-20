/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.models;

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
public class ModelsRule extends Model {

  @JsonProperty("allowedAction")
  private String allowedAction;

  @JsonProperty("ruleDetail")
  private List<ModelsRuleInformation> ruleDetail;

  @JsonIgnore
  public String getAllowedAction() {
    return this.allowedAction;
  }

  @JsonIgnore
  public AllowedAction getAllowedActionAsEnum() {
    return AllowedAction.valueOf(this.allowedAction);
  }

  @JsonIgnore
  public void setAllowedAction(final String allowedAction) {
    this.allowedAction = allowedAction;
  }

  @JsonIgnore
  public void setAllowedActionFromEnum(final AllowedAction allowedAction) {
    this.allowedAction = allowedAction.toString();
  }

  @JsonIgnore
  public ModelsRule createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsRule> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsRule>>() {});
  }

  public enum AllowedAction {
    CreateGroup("createGroup"),
    JoinGroup("joinGroup");

    private String value;

    AllowedAction(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelsRuleBuilder {
    private String allowedAction;

    public ModelsRuleBuilder allowedAction(final String allowedAction) {
      this.allowedAction = allowedAction;
      return this;
    }

    public ModelsRuleBuilder allowedActionFromEnum(final AllowedAction allowedAction) {
      this.allowedAction = allowedAction.toString();
      return this;
    }
  }
}
