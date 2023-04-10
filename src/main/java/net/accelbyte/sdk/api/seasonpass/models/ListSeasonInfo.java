/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.models;

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
public class ListSeasonInfo extends Model {

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("defaultLanguage")
  private String defaultLanguage;

  @JsonProperty("end")
  private String end;

  @JsonProperty("id")
  private String id;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("passCodes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> passCodes;

  @JsonProperty("publishedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String publishedAt;

  @JsonProperty("start")
  private String start;

  @JsonProperty("status")
  private String status;

  @JsonProperty("tierItemId")
  private String tierItemId;

  @JsonProperty("tierItemName")
  private String tierItemName;

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
  public ListSeasonInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ListSeasonInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ListSeasonInfo>>() {});
  }

  public enum Status {
    DRAFT("DRAFT"),
    PUBLISHED("PUBLISHED"),
    RETIRED("RETIRED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ListSeasonInfoBuilder {
    private String status;

    public ListSeasonInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public ListSeasonInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
