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
public class DLCRecord extends Model {

  @JsonProperty("id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String id;

  @JsonProperty("obtainedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String obtainedAt;

  @JsonProperty("revocationResult")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private RevocationResult revocationResult;

  @JsonProperty("revokeResults")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<RevokeResult> revokeResults;

  @JsonProperty("revokedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String revokedAt;

  @JsonProperty("rewards")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<PlatformReward> rewards;

  @JsonProperty("sources")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> sources;

  @JsonProperty("status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("transactionId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String transactionId;

  @JsonProperty("version")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer version;

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
  public DLCRecord createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<DLCRecord> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<DLCRecord>>() {});
  }

  public enum Status {
    FULFILLED("FULFILLED"),
    REVOKED("REVOKED"),
    REVOKEFAILED("REVOKE_FAILED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class DLCRecordBuilder {
    private String status;

    public DLCRecordBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public DLCRecordBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
