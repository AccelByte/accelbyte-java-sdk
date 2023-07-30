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
public class IAPConsumeHistoryInfo extends Model {

  @JsonProperty("clientRequestParameter")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ClientRequestParameter clientRequestParameter;

  @JsonProperty("consumeItems")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ConsumeItem> consumeItems;

  @JsonProperty("iapType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String iapType;

  @JsonProperty("id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String id;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("requestBody")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> requestBody;

  @JsonProperty("requestHistories")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<RequestHistory> requestHistories;

  @JsonProperty("requestUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String requestUrl;

  @JsonProperty("status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("userId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String userId;

  @JsonIgnore
  public String getIapType() {
    return this.iapType;
  }

  @JsonIgnore
  public IapType getIapTypeAsEnum() {
    return IapType.valueOf(this.iapType);
  }

  @JsonIgnore
  public void setIapType(final String iapType) {
    this.iapType = iapType;
  }

  @JsonIgnore
  public void setIapTypeFromEnum(final IapType iapType) {
    this.iapType = iapType.toString();
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
  public IAPConsumeHistoryInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<IAPConsumeHistoryInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<IAPConsumeHistoryInfo>>() {});
  }

  public enum IapType {
    APPLE("APPLE"),
    EPICGAMES("EPICGAMES"),
    GOOGLE("GOOGLE"),
    OCULUS("OCULUS"),
    PLAYSTATION("PLAYSTATION"),
    STADIA("STADIA"),
    STEAM("STEAM"),
    TWITCH("TWITCH"),
    XBOX("XBOX");

    private String value;

    IapType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    FAIL("FAIL"),
    PENDING("PENDING"),
    SUCCESS("SUCCESS");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class IAPConsumeHistoryInfoBuilder {
    private String iapType;
    private String status;

    public IAPConsumeHistoryInfoBuilder iapType(final String iapType) {
      this.iapType = iapType;
      return this;
    }

    public IAPConsumeHistoryInfoBuilder iapTypeFromEnum(final IapType iapType) {
      this.iapType = iapType.toString();
      return this;
    }

    public IAPConsumeHistoryInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public IAPConsumeHistoryInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
