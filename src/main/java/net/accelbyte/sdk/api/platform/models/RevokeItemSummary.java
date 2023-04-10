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
public class RevokeItemSummary extends Model {

  @JsonProperty("itemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemId;

  @JsonProperty("itemSku")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemSku;

  @JsonProperty("itemType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemType;

  @JsonProperty("revokeStatus")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String revokeStatus;

  @JsonIgnore
  public String getRevokeStatus() {
    return this.revokeStatus;
  }

  @JsonIgnore
  public RevokeStatus getRevokeStatusAsEnum() {
    return RevokeStatus.valueOf(this.revokeStatus);
  }

  @JsonIgnore
  public void setRevokeStatus(final String revokeStatus) {
    this.revokeStatus = revokeStatus;
  }

  @JsonIgnore
  public void setRevokeStatusFromEnum(final RevokeStatus revokeStatus) {
    this.revokeStatus = revokeStatus.toString();
  }

  @JsonIgnore
  public RevokeItemSummary createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RevokeItemSummary> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<RevokeItemSummary>>() {});
  }

  public enum RevokeStatus {
    COMPLETED("COMPLETED"),
    SKIPPED("SKIPPED");

    private String value;

    RevokeStatus(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class RevokeItemSummaryBuilder {
    private String revokeStatus;

    public RevokeItemSummaryBuilder revokeStatus(final String revokeStatus) {
      this.revokeStatus = revokeStatus;
      return this;
    }

    public RevokeItemSummaryBuilder revokeStatusFromEnum(final RevokeStatus revokeStatus) {
      this.revokeStatus = revokeStatus.toString();
      return this;
    }
  }
}
