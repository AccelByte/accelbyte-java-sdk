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
public class KeyInfo extends Model {

  @JsonProperty("acquireOrderNo")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String acquireOrderNo;

  @JsonProperty("acquireUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String acquireUserId;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("id")
  private String id;

  @JsonProperty("keyFile")
  private String keyFile;

  @JsonProperty("keyGroupId")
  private String keyGroupId;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("status")
  private String status;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("value")
  private String value;

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
  public KeyInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<KeyInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<KeyInfo>>() {});
  }

  public enum Status {
    ACQUIRED("ACQUIRED"),
    ACTIVE("ACTIVE");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class KeyInfoBuilder {
    private String status;

    public KeyInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public KeyInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
