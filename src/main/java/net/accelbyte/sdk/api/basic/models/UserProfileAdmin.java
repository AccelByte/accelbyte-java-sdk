/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import java.util.Map;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserProfileAdmin extends Model {

  @JsonProperty("avatarLargeUrl")
  private String avatarLargeUrl;

  @JsonProperty("avatarSmallUrl")
  private String avatarSmallUrl;

  @JsonProperty("avatarUrl")
  private String avatarUrl;

  @JsonProperty("customAttributes")
  private Map<String, ?> customAttributes;

  @JsonProperty("dateOfBirth")
  private String dateOfBirth;

  @JsonProperty("firstName")
  private String firstName;

  @JsonProperty("language")
  private String language;

  @JsonProperty("lastName")
  private String lastName;

  @JsonProperty("status")
  private String status;

  @JsonProperty("timeZone")
  private String timeZone;

  @JsonProperty("zipCode")
  private String zipCode;

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
  public UserProfileAdmin createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<UserProfileAdmin> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<UserProfileAdmin>>() {});
  }

  public enum Status {
    ACTIVE("ACTIVE"),
    INACTIVE("INACTIVE");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class UserProfileAdminBuilder {
    private String status;

    public UserProfileAdminBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public UserProfileAdminBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
