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
public class LootBoxReward extends Model {

  @JsonProperty("lootBoxItems")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<BoxItem> lootBoxItems;

  @JsonProperty("name")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String name;

  @JsonProperty("odds")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Float odds;

  @JsonProperty("type")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String type;

  @JsonProperty("weight")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer weight;

  @JsonIgnore
  public String getType() {
    return this.type;
  }

  @JsonIgnore
  public Type getTypeAsEnum() {
    return Type.valueOf(this.type);
  }

  @JsonIgnore
  public void setType(final String type) {
    this.type = type;
  }

  @JsonIgnore
  public void setTypeFromEnum(final Type type) {
    this.type = type.toString();
  }

  @JsonIgnore
  public LootBoxReward createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<LootBoxReward> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<LootBoxReward>>() {});
  }

  public enum Type {
    PROBABILITYGROUP("PROBABILITY_GROUP"),
    REWARD("REWARD"),
    REWARDGROUP("REWARD_GROUP");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class LootBoxRewardBuilder {
    private String type;

    public LootBoxRewardBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public LootBoxRewardBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}
