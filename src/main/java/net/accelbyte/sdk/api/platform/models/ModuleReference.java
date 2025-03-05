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
public class ModuleReference extends Model {

  @JsonProperty("module")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String module;

  @JsonProperty("references")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ItemReference> references;

  @JsonIgnore
  public String getModule() {
    return this.module;
  }

  @JsonIgnore
  public Module getModuleAsEnum() {
    return Module.valueOf(this.module);
  }

  @JsonIgnore
  public void setModule(final String module) {
    this.module = module;
  }

  @JsonIgnore
  public void setModuleFromEnum(final Module module) {
    this.module = module.toString();
  }

  @JsonIgnore
  public ModuleReference createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModuleReference> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModuleReference>>() {});
  }

  public enum Module {
    CAMPAIGN("CAMPAIGN"),
    CHALLENGECONFIGURATIONS("CHALLENGE_CONFIGURATIONS"),
    DLCCONFIGURATION("DLC_CONFIGURATION"),
    ENTITLEMENT("ENTITLEMENT"),
    ITEM("ITEM"),
    ITEMMAPPING("ITEM_MAPPING"),
    REWARDCONFIGURATION("REWARD_CONFIGURATION"),
    SEASONPASSCODE("SEASON_PASS_CODE"),
    SEASONPASSREWARD("SEASON_PASS_REWARD"),
    SEASONPASSTIER("SEASON_PASS_TIER"),
    SECTION("SECTION");

    private String value;

    Module(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModuleReferenceBuilder {
    private String module;

    public ModuleReferenceBuilder module(final String module) {
      this.module = module;
      return this;
    }

    public ModuleReferenceBuilder moduleFromEnum(final Module module) {
      this.module = module.toString();
      return this;
    }
  }
}
