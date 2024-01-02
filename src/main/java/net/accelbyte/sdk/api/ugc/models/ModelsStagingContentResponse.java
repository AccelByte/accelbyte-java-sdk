/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.models;

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
public class ModelsStagingContentResponse extends Model {

  @JsonProperty("channelId")
  private String channelId;

  @JsonProperty("createdTime")
  private String createdTime;

  @JsonProperty("customAttributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> customAttributes;

  @JsonProperty("fileExtension")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String fileExtension;

  @JsonProperty("id")
  private String id;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("note")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String note;

  @JsonProperty("payloadURL")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String payloadURL;

  @JsonProperty("screenshots")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsScreenshotResponse> screenshots;

  @JsonProperty("status")
  private String status;

  @JsonProperty("subType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String subType;

  @JsonProperty("tags")
  private List<String> tags;

  @JsonProperty("type")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String type;

  @JsonProperty("updatedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedTime;

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
  public ModelsStagingContentResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsStagingContentResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsStagingContentResponse>>() {});
  }

  public enum Status {
    APPROVED("APPROVED"),
    PENDING("PENDING"),
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

  public static class ModelsStagingContentResponseBuilder {
    private String status;

    public ModelsStagingContentResponseBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public ModelsStagingContentResponseBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
