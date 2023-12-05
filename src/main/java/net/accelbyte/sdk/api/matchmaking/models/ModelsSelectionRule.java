/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.models;

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
public class ModelsSelectionRule extends Model {

  @JsonProperty("selection")
  private String selection;

  @JsonProperty("threshold")
  private Integer threshold;

  @JsonIgnore
  public String getSelection() {
    return this.selection;
  }

  @JsonIgnore
  public Selection getSelectionAsEnum() {
    return Selection.valueOf(this.selection);
  }

  @JsonIgnore
  public void setSelection(final String selection) {
    this.selection = selection;
  }

  @JsonIgnore
  public void setSelectionFromEnum(final Selection selection) {
    this.selection = selection.toString();
  }

  @JsonIgnore
  public ModelsSelectionRule createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsSelectionRule> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsSelectionRule>>() {});
  }

  public enum Selection {
    Newest("newest"),
    Oldest("oldest"),
    Pivot("pivot"),
    Random("random");

    private String value;

    Selection(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelsSelectionRuleBuilder {
    private String selection;

    public ModelsSelectionRuleBuilder selection(final String selection) {
      this.selection = selection;
      return this;
    }

    public ModelsSelectionRuleBuilder selectionFromEnum(final Selection selection) {
      this.selection = selection.toString();
      return this;
    }
  }
}
