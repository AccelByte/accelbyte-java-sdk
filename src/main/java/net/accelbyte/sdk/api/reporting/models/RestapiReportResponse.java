/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.models;

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
public class RestapiReportResponse extends Model {

  @JsonProperty("additionalInfo")
  private Map<String, ?> additionalInfo;

  @JsonProperty("category")
  private String category;

  @JsonProperty("comment")
  private String comment;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("extensionCategory")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String extensionCategory;

  @JsonProperty("id")
  private String id;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("objectId")
  private String objectId;

  @JsonProperty("objectType")
  private String objectType;

  @JsonProperty("reason")
  private String reason;

  @JsonProperty("reporterId")
  private String reporterId;

  @JsonProperty("ticketId")
  private String ticketId;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public String getCategory() {
    return this.category;
  }

  @JsonIgnore
  public Category getCategoryAsEnum() {
    return Category.valueOf(this.category);
  }

  @JsonIgnore
  public void setCategory(final String category) {
    this.category = category;
  }

  @JsonIgnore
  public void setCategoryFromEnum(final Category category) {
    this.category = category.toString();
  }

  @JsonIgnore
  public RestapiReportResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RestapiReportResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<RestapiReportResponse>>() {});
  }

  public enum Category {
    CHAT("CHAT"),
    EXTENSION("EXTENSION"),
    UGC("UGC"),
    USER("USER");

    private String value;

    Category(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class RestapiReportResponseBuilder {
    private String category;

    public RestapiReportResponseBuilder category(final String category) {
      this.category = category;
      return this;
    }

    public RestapiReportResponseBuilder categoryFromEnum(final Category category) {
      this.category = category.toString();
      return this;
    }
  }
}
