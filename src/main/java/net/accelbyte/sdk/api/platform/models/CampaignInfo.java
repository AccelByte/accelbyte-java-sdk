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
public class CampaignInfo extends Model {

  @JsonProperty("boothName")
  private String boothName;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("id")
  private String id;

  @JsonProperty("items")
  @JsonInclude(JsonInclude.Include.NON_NULL)
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
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String redeemEnd;

  @JsonProperty("redeemStart")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String redeemStart;

  @JsonProperty("redeemType")
  private String redeemType;

  @JsonProperty("status")
  private String status;

  @JsonProperty("tags")
  @JsonInclude(JsonInclude.Include.NON_NULL)
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
