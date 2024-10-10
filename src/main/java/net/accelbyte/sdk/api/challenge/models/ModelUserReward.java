/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.models;

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
public class ModelUserReward extends Model {

  @JsonProperty("challengeCode")
  private String challengeCode;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("goalCode")
  private String goalCode;

  @JsonProperty("id")
  private String id;

  @JsonProperty("itemId")
  private String itemId;

  @JsonProperty("itemName")
  private String itemName;

  @JsonProperty("qty")
  private Float qty;

  @JsonProperty("status")
  private String status;

  @JsonProperty("type")
  private String type;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public String getStatus() {
    return this.status;
  }

  @JsonIgnore
  public Status getStatusAsEnum() {
    return Status.valueOf(this.status);
  }

  @JsonIgnore
  public void setStatus(final String status) {
    this.status = status;
  }

  @JsonIgnore
  public void setStatusFromEnum(final Status status) {
    this.status = status.toString();
  }

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
  public ModelUserReward createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelUserReward> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserReward>>() {});
  }

  public enum Status {
    CLAIMED("CLAIMED"),
    UNCLAIMED("UNCLAIMED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Type {
    ENTITLEMENT("ENTITLEMENT"),
    STATISTIC("STATISTIC");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelUserRewardBuilder {
    private String status;
    private String type;

    public ModelUserRewardBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public ModelUserRewardBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public ModelUserRewardBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public ModelUserRewardBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}
