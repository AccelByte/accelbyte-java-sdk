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
public class EntitlementPlatformConfigUpdate extends Model {

  @JsonProperty("allowedPlatformOrigins")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> allowedPlatformOrigins;

  @JsonIgnore
  public List<String> getAllowedPlatformOrigins() {
    return this.allowedPlatformOrigins;
  }

  @JsonIgnore
  public List<AllowedPlatformOrigins> getAllowedPlatformOriginsAsEnum() {
    ArrayList<AllowedPlatformOrigins> en = new ArrayList<AllowedPlatformOrigins>();
    for (String e : this.allowedPlatformOrigins) en.add(AllowedPlatformOrigins.valueOf(e));
    return en;
  }

  @JsonIgnore
  public void setAllowedPlatformOrigins(final List<String> allowedPlatformOrigins) {
    this.allowedPlatformOrigins = allowedPlatformOrigins;
  }

  @JsonIgnore
  public void setAllowedPlatformOriginsFromEnum(
      final List<AllowedPlatformOrigins> allowedPlatformOrigins) {
    ArrayList<String> en = new ArrayList<String>();
    for (AllowedPlatformOrigins e : allowedPlatformOrigins) en.add(e.toString());
    this.allowedPlatformOrigins = en;
  }

  @JsonIgnore
  public EntitlementPlatformConfigUpdate createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<EntitlementPlatformConfigUpdate> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<EntitlementPlatformConfigUpdate>>() {});
  }

  public enum AllowedPlatformOrigins {
    Epic("Epic"),
    GooglePlay("GooglePlay"),
    IOS("IOS"),
    Nintendo("Nintendo"),
    Oculus("Oculus"),
    Other("Other"),
    Playstation("Playstation"),
    Steam("Steam"),
    System("System"),
    Twitch("Twitch"),
    Xbox("Xbox");

    private String value;

    AllowedPlatformOrigins(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class EntitlementPlatformConfigUpdateBuilder {
    private List<String> allowedPlatformOrigins;

    public EntitlementPlatformConfigUpdateBuilder allowedPlatformOrigins(
        final List<String> allowedPlatformOrigins) {
      this.allowedPlatformOrigins = allowedPlatformOrigins;
      return this;
    }

    public EntitlementPlatformConfigUpdateBuilder allowedPlatformOriginsFromEnum(
        final List<AllowedPlatformOrigins> allowedPlatformOrigins) {
      ArrayList<String> en = new ArrayList<String>();
      for (AllowedPlatformOrigins e : allowedPlatformOrigins) en.add(e.toString());
      this.allowedPlatformOrigins = en;
      return this;
    }
  }
}
