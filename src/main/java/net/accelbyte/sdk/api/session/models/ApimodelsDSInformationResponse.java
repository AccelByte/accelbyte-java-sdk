/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.models;

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
public class ApimodelsDSInformationResponse extends Model {

  @JsonProperty("CreatedAt")
  private String createdAt;

  @JsonProperty("RequestedAt")
  private String requestedAt;

  @JsonProperty("Server")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsGameServer server;

  @JsonProperty("Status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("StatusV2")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String statusV2;

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
  public String getStatusV2() {
    return this.statusV2;
  }

  @JsonIgnore
  public StatusV2 getStatusV2AsEnum() {
    return StatusV2.valueOf(this.statusV2);
  }

  @JsonIgnore
  public void setStatusV2(final String statusV2) {
    this.statusV2 = statusV2;
  }

  @JsonIgnore
  public void setStatusV2FromEnum(final StatusV2 statusV2) {
    this.statusV2 = statusV2.toString();
  }

  @JsonIgnore
  public ApimodelsDSInformationResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsDSInformationResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsDSInformationResponse>>() {});
  }

  public enum Status {
    AVAILABLE("AVAILABLE"),
    DSERROR("DS_ERROR"),
    FAILEDTOREQUEST("FAILED_TO_REQUEST"),
    NEEDTOREQUEST("NEED_TO_REQUEST"),
    PREPARING("PREPARING"),
    REQUESTED("REQUESTED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum StatusV2 {
    AVAILABLE("AVAILABLE"),
    DSCANCELLED("DS_CANCELLED"),
    DSERROR("DS_ERROR"),
    ENDED("ENDED"),
    FAILEDTOREQUEST("FAILED_TO_REQUEST"),
    NEEDTOREQUEST("NEED_TO_REQUEST"),
    PREPARING("PREPARING"),
    REQUESTED("REQUESTED"),
    UNKNOWN("UNKNOWN");

    private String value;

    StatusV2(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ApimodelsDSInformationResponseBuilder {
    private String status;
    private String statusV2;

    public ApimodelsDSInformationResponseBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public ApimodelsDSInformationResponseBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public ApimodelsDSInformationResponseBuilder statusV2(final String statusV2) {
      this.statusV2 = statusV2;
      return this;
    }

    public ApimodelsDSInformationResponseBuilder statusV2FromEnum(final StatusV2 statusV2) {
      this.statusV2 = statusV2.toString();
      return this;
    }
  }
}
