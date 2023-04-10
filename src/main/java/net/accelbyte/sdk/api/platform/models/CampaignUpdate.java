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
public class CampaignUpdate extends Model {

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("items")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<RedeemableItem> items;

  @JsonProperty("maxRedeemCountPerCampaignPerUser")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer maxRedeemCountPerCampaignPerUser;

  @JsonProperty("maxRedeemCountPerCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer maxRedeemCountPerCode;

  @JsonProperty("maxRedeemCountPerCodePerUser")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer maxRedeemCountPerCodePerUser;

  @JsonProperty("maxSaleCount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer maxSaleCount;

  @JsonProperty("name")
  private String name;

  @JsonProperty("redeemEnd")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String redeemEnd;

  @JsonProperty("redeemStart")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String redeemStart;

  @JsonProperty("redeemType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String redeemType;

  @JsonProperty("status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("tags")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> tags;

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
  public CampaignUpdate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<CampaignUpdate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<CampaignUpdate>>() {});
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

  public static class CampaignUpdateBuilder {
    private String redeemType;
    private String status;

    public CampaignUpdateBuilder redeemType(final String redeemType) {
      this.redeemType = redeemType;
      return this;
    }

    public CampaignUpdateBuilder redeemTypeFromEnum(final RedeemType redeemType) {
      this.redeemType = redeemType.toString();
      return this;
    }

    public CampaignUpdateBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public CampaignUpdateBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
