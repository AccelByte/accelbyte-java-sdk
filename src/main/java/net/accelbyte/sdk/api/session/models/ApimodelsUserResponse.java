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
public class ApimodelsUserResponse extends Model {

  @JsonProperty("id")
  private String id;

  @JsonProperty("platformID")
  private String platformID;

  @JsonProperty("platformUserID")
  private String platformUserID;

  @JsonProperty("previousStatus")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String previousStatus;

  @JsonProperty("status")
  private String status;

  @JsonProperty("statusV2")
  private String statusV2;

  @JsonProperty("updatedAt")
  private String updatedAt;

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
  public ApimodelsUserResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsUserResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelsUserResponse>>() {});
  }

  public enum Status {
    CONNECTED("CONNECTED"),
    INVITED("INVITED"),
    JOINED("JOINED"),
    KICKED("KICKED"),
    LEFT("LEFT"),
    REJECTED("REJECTED");

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
    CANCELLED("CANCELLED"),
    CONNECTED("CONNECTED"),
    DISCONNECTED("DISCONNECTED"),
    DROPPED("DROPPED"),
    INVITED("INVITED"),
    JOINED("JOINED"),
    KICKED("KICKED"),
    LEFT("LEFT"),
    REJECTED("REJECTED"),
    TERMINATED("TERMINATED"),
    TIMEOUT("TIMEOUT");

    private String value;

    StatusV2(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ApimodelsUserResponseBuilder {
    private String status;
    private String statusV2;

    public ApimodelsUserResponseBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public ApimodelsUserResponseBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public ApimodelsUserResponseBuilder statusV2(final String statusV2) {
      this.statusV2 = statusV2;
      return this;
    }

    public ApimodelsUserResponseBuilder statusV2FromEnum(final StatusV2 statusV2) {
      this.statusV2 = statusV2.toString();
      return this;
    }
  }
}
