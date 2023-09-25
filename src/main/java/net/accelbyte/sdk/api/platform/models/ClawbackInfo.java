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
public class ClawbackInfo extends Model {

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("dryRun")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean dryRun;

  @JsonProperty("eventContent")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> eventContent;

  @JsonProperty("eventId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String eventId;

  @JsonProperty("eventType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String eventType;

  @JsonProperty("externalOrderId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String externalOrderId;

  @JsonProperty("feedbackContent")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> feedbackContent;

  @JsonProperty("feedbackStatus")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String feedbackStatus;

  @JsonProperty("feedbackStatusReason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String feedbackStatusReason;

  @JsonProperty("id")
  private String id;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("platform")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platform;

  @JsonProperty("processId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String processId;

  @JsonProperty("status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("statusReason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String statusReason;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonProperty("userId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String userId;

  @JsonIgnore
  public String getFeedbackStatus() {
    return this.feedbackStatus;
  }

  @JsonIgnore
  public FeedbackStatus getFeedbackStatusAsEnum() {
    return FeedbackStatus.valueOf(this.feedbackStatus);
  }

  @JsonIgnore
  public void setFeedbackStatus(final String feedbackStatus) {
    this.feedbackStatus = feedbackStatus;
  }

  @JsonIgnore
  public void setFeedbackStatusFromEnum(final FeedbackStatus feedbackStatus) {
    this.feedbackStatus = feedbackStatus.toString();
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
  public ClawbackInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ClawbackInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ClawbackInfo>>() {});
  }

  public enum FeedbackStatus {
    FAIL("FAIL"),
    INIT("INIT"),
    SUCCESS("SUCCESS");

    private String value;

    FeedbackStatus(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    FAIL("FAIL"),
    IGNORED("IGNORED"),
    INIT("INIT"),
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

  public static class ClawbackInfoBuilder {
    private String feedbackStatus;
    private String status;

    public ClawbackInfoBuilder feedbackStatus(final String feedbackStatus) {
      this.feedbackStatus = feedbackStatus;
      return this;
    }

    public ClawbackInfoBuilder feedbackStatusFromEnum(final FeedbackStatus feedbackStatus) {
      this.feedbackStatus = feedbackStatus.toString();
      return this;
    }

    public ClawbackInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public ClawbackInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
