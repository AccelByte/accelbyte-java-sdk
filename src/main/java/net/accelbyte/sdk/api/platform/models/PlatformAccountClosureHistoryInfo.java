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
public class PlatformAccountClosureHistoryInfo extends Model {

  @JsonProperty("entitlements")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<SimpleEntitlement> entitlements;

  @JsonProperty("id")
  private String id;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("platform")
  private String platform;

  @JsonProperty("progression")
  private String progression;

  @JsonProperty("userDlcS")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<SimpleUserDLC> userDlcS;

  @JsonProperty("userId")
  private String userId;

  @JsonProperty("wallets")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<SimpleWallet> wallets;

  @JsonIgnore
  public String getProgression() {
    return this.progression;
  }

  @JsonIgnore
  public Progression getProgressionAsEnum() {
    return Progression.valueOf(this.progression);
  }

  @JsonIgnore
  public void setProgression(final String progression) {
    this.progression = progression;
  }

  @JsonIgnore
  public void setProgressionFromEnum(final Progression progression) {
    this.progression = progression.toString();
  }

  @JsonIgnore
  public PlatformAccountClosureHistoryInfo createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PlatformAccountClosureHistoryInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<PlatformAccountClosureHistoryInfo>>() {});
  }

  public enum Progression {
    INPROGRESS("IN_PROGRESS"),
    SUCCESS("SUCCESS");

    private String value;

    Progression(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PlatformAccountClosureHistoryInfoBuilder {
    private String progression;

    public PlatformAccountClosureHistoryInfoBuilder progression(final String progression) {
      this.progression = progression;
      return this;
    }

    public PlatformAccountClosureHistoryInfoBuilder progressionFromEnum(
        final Progression progression) {
      this.progression = progression.toString();
      return this;
    }
  }
}
