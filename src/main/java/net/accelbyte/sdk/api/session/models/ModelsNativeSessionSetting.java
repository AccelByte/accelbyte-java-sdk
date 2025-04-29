/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.models;

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
public class ModelsNativeSessionSetting extends Model {

  @JsonProperty("PSNDisableSystemUIMenu")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> psnDisableSystemUIMenu;

  @JsonProperty("PSNServiceLabel")
  private Integer psnServiceLabel;

  @JsonProperty("PSNSupportedPlatforms")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> psnSupportedPlatforms;

  @JsonProperty("SessionTitle")
  private String sessionTitle;

  @JsonProperty("ShouldSync")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean shouldSync;

  @JsonProperty("XboxAllowCrossPlatform")
  private Boolean xboxAllowCrossPlatform;

  @JsonProperty("XboxSandboxID")
  private String xboxSandboxID;

  @JsonProperty("XboxServiceConfigID")
  private String xboxServiceConfigID;

  @JsonProperty("XboxSessionTemplateName")
  private String xboxSessionTemplateName;

  @JsonProperty("XboxTitleID")
  private String xboxTitleID;

  @JsonProperty("localizedSessionName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> localizedSessionName;

  @JsonIgnore
  public List<String> getPSNDisableSystemUIMenu() {
    return this.psnDisableSystemUIMenu;
  }

  @JsonIgnore
  public List<PSNDisableSystemUIMenu> getPSNDisableSystemUIMenuAsEnum() {
    ArrayList<PSNDisableSystemUIMenu> en = new ArrayList<PSNDisableSystemUIMenu>();
    for (String e : this.psnDisableSystemUIMenu) en.add(PSNDisableSystemUIMenu.valueOf(e));
    return en;
  }

  @JsonIgnore
  public void setPSNDisableSystemUIMenu(final List<String> psnDisableSystemUIMenu) {
    this.psnDisableSystemUIMenu = psnDisableSystemUIMenu;
  }

  @JsonIgnore
  public void setPSNDisableSystemUIMenuFromEnum(
      final List<PSNDisableSystemUIMenu> psnDisableSystemUIMenu) {
    ArrayList<String> en = new ArrayList<String>();
    for (PSNDisableSystemUIMenu e : psnDisableSystemUIMenu) en.add(e.toString());
    this.psnDisableSystemUIMenu = en;
  }

  @JsonIgnore
  public ModelsNativeSessionSetting createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsNativeSessionSetting> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsNativeSessionSetting>>() {});
  }

  public enum PSNDisableSystemUIMenu {
    KICK("KICK"),
    PROMOTETOLEADER("PROMOTE_TO_LEADER"),
    UPDATEINVITABLEUSERTYPE("UPDATE_INVITABLE_USER_TYPE"),
    UPDATEJOINABLEUSERTYPE("UPDATE_JOINABLE_USER_TYPE");

    private String value;

    PSNDisableSystemUIMenu(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelsNativeSessionSettingBuilder {
    private List<String> psnDisableSystemUIMenu;

    public ModelsNativeSessionSettingBuilder psnDisableSystemUIMenu(
        final List<String> psnDisableSystemUIMenu) {
      this.psnDisableSystemUIMenu = psnDisableSystemUIMenu;
      return this;
    }

    public ModelsNativeSessionSettingBuilder psnDisableSystemUIMenuFromEnum(
        final List<PSNDisableSystemUIMenu> psnDisableSystemUIMenu) {
      ArrayList<String> en = new ArrayList<String>();
      for (PSNDisableSystemUIMenu e : psnDisableSystemUIMenu) en.add(e.toString());
      this.psnDisableSystemUIMenu = en;
      return this;
    }
  }
}
