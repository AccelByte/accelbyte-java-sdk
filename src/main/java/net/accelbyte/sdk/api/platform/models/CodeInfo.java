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
public class CodeInfo extends Model {

  @JsonProperty("acquireOrderNo")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String acquireOrderNo;

  @JsonProperty("acquireUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String acquireUserId;

  @JsonProperty("batchNo")
  private Integer batchNo;

  @JsonProperty("campaignId")
  private String campaignId;

  @JsonProperty("createdAt")
  private String createdAt;

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

  @JsonProperty("redeemedCount")
  private Integer redeemedCount;

  @JsonProperty("remainder")
  private Integer remainder;

  @JsonProperty("status")
  private String status;

  @JsonProperty("type")
  private String type;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("value")
  private String value;

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
  public CodeInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<CodeInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<CodeInfo>>() {});
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

  public static class CodeInfoBuilder {
    private String redeemType;
    private String status;
    private String type;

    public CodeInfoBuilder redeemType(final String redeemType) {
      this.redeemType = redeemType;
      return this;
    }

    public CodeInfoBuilder redeemTypeFromEnum(final RedeemType redeemType) {
      this.redeemType = redeemType.toString();
      return this;
    }

    public CodeInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public CodeInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public CodeInfoBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public CodeInfoBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}
