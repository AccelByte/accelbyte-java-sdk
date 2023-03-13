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
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class TwitchSyncResult extends Model {

  @JsonProperty("iapOrderStatus")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String iapOrderStatus;

  @JsonProperty("itemSku")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemSku;

  @JsonProperty("transactionId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String transactionId;

  @JsonIgnore
  public String getIapOrderStatus() {
    return this.iapOrderStatus;
  }

  @JsonIgnore
  public IapOrderStatus getIapOrderStatusAsEnum() {
    return IapOrderStatus.valueOf(this.iapOrderStatus);
  }

  @JsonIgnore
  public void setIapOrderStatus(final String iapOrderStatus) {
    this.iapOrderStatus = iapOrderStatus;
  }

  @JsonIgnore
  public void setIapOrderStatusFromEnum(final IapOrderStatus iapOrderStatus) {
    this.iapOrderStatus = iapOrderStatus.toString();
  }

  @JsonIgnore
  public TwitchSyncResult createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<TwitchSyncResult> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<TwitchSyncResult>>() {});
  }

  public enum IapOrderStatus {
    FAILED("FAILED"),
    FULFILLED("FULFILLED"),
    VERIFIED("VERIFIED");

    private String value;

    IapOrderStatus(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class TwitchSyncResultBuilder {
    private String iapOrderStatus;

    public TwitchSyncResultBuilder iapOrderStatus(final String iapOrderStatus) {
      this.iapOrderStatus = iapOrderStatus;
      return this;
    }

    public TwitchSyncResultBuilder iapOrderStatusFromEnum(final IapOrderStatus iapOrderStatus) {
      this.iapOrderStatus = iapOrderStatus.toString();
      return this;
    }
  }
}
