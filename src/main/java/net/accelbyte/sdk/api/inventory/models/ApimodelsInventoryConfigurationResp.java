/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.models;

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
public class ApimodelsInventoryConfigurationResp extends Model {

  @JsonProperty("code")
  private String code;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("description")
  private String description;

  @JsonProperty("id")
  private String id;

  @JsonProperty("initialMaxSlots")
  private Integer initialMaxSlots;

  @JsonProperty("maxInstancesPerUser")
  private Integer maxInstancesPerUser;

  @JsonProperty("maxUpgradeSlots")
  private Integer maxUpgradeSlots;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("status")
  private String status;

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
  public ApimodelsInventoryConfigurationResp createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsInventoryConfigurationResp> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsInventoryConfigurationResp>>() {});
  }

  public enum Status {
    INIT("INIT"),
    TIED("TIED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ApimodelsInventoryConfigurationRespBuilder {
    private String status;

    public ApimodelsInventoryConfigurationRespBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public ApimodelsInventoryConfigurationRespBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
