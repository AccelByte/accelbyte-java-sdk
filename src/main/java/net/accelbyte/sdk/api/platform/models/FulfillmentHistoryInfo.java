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
public class FulfillmentHistoryInfo extends Model {

  @JsonProperty("code")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String code;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("creditSummaries")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<CreditSummary> creditSummaries;

  @JsonProperty("entitlementSummaries")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<EntitlementSummary> entitlementSummaries;

  @JsonProperty("extensionFulfillmentSummaries")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ExtensionFulfillmentSummary> extensionFulfillmentSummaries;

  @JsonProperty("fulfillItems")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<FulfillmentItem> fulfillItems;

  @JsonProperty("fulfillmentError")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private FulfillmentError fulfillmentError;

  @JsonProperty("grantedItemIds")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> grantedItemIds;

  @JsonProperty("id")
  private String id;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("orderNo")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String orderNo;

  @JsonProperty("status")
  private String status;

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
  public FulfillmentHistoryInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<FulfillmentHistoryInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<FulfillmentHistoryInfo>>() {});
  }

  public enum Status {
    FAIL("FAIL"),
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

  public static class FulfillmentHistoryInfoBuilder {
    private String status;

    public FulfillmentHistoryInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public FulfillmentHistoryInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
