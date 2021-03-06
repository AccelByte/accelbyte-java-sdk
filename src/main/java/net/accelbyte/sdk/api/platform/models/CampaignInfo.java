/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CampaignInfo extends Model {

  @JsonProperty("boothName")
  private String boothName;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("description")
  private String description;

  @JsonProperty("id")
  private String id;

  @JsonProperty("items")
  private List<RedeemableItem> items;

  @JsonProperty("maxRedeemCountPerCampaignPerUser")
  private Integer maxRedeemCountPerCampaignPerUser;

  @JsonProperty("maxRedeemCountPerCode")
  private Integer maxRedeemCountPerCode;

  @JsonProperty("maxRedeemCountPerCodePerUser")
  private Integer maxRedeemCountPerCodePerUser;

  @JsonProperty("maxSaleCount")
  private Integer maxSaleCount;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("redeemEnd")
  private String redeemEnd;

  @JsonProperty("redeemStart")
  private String redeemStart;

  @JsonProperty("redeemType")
  private String redeemType;

  @JsonProperty("status")
  private String status;

  @JsonProperty("tags")
  private List<String> tags;

  @JsonProperty("type")
  private String type;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public String getRedeemType() {
    return this.redeemType;
  }

  @JsonIgnore
  public RedeemType getRedeemTypeAsEnum() {
    return RedeemType.valueOf(this.redeemType);
  }

  @JsonIgnore
  public void setRedeemType(final String redeemType) {
    this.redeemType = redeemType;
  }

  @JsonIgnore
  public void setRedeemTypeFromEnum(final RedeemType redeemType) {
    this.redeemType = redeemType.toString();
  }

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
  public CampaignInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<CampaignInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<CampaignInfo>>() {});
  }

  public enum RedeemType {
    ITEM("ITEM");

    private String value;

    RedeemType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    ACTIVE("ACTIVE"),
    INACTIVE("INACTIVE");

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
    REDEMPTION("REDEMPTION");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class CampaignInfoBuilder {
    private String redeemType;
    private String status;
    private String type;

    public CampaignInfoBuilder redeemType(final String redeemType) {
      this.redeemType = redeemType;
      return this;
    }

    public CampaignInfoBuilder redeemTypeFromEnum(final RedeemType redeemType) {
      this.redeemType = redeemType.toString();
      return this;
    }

    public CampaignInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public CampaignInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public CampaignInfoBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public CampaignInfoBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}
