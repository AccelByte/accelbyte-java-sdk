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
public class SeasonInfo extends Model {

  @JsonProperty("autoClaim")
  private Boolean autoClaim;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("defaultLanguage")
  private String defaultLanguage;

  @JsonProperty("defaultRequiredExp")
  private Integer defaultRequiredExp;

  @JsonProperty("draftStoreId")
  private String draftStoreId;

  @JsonProperty("end")
  private String end;

  @JsonProperty("excessStrategy")
  private ExcessStrategy excessStrategy;

  @JsonProperty("id")
  private String id;

  @JsonProperty("images")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<Image> images;

  @JsonProperty("localizations")
  private Map<String, Localization> localizations;

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
  public SeasonInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<SeasonInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<SeasonInfo>>() {});
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

  public static class SeasonInfoBuilder {
    private String status;

    public SeasonInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public SeasonInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
