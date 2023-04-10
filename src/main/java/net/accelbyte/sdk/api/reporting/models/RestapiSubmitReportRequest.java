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
public class RestapiSubmitReportRequest extends Model {

  @JsonProperty("additionalInfo")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> additionalInfo;

  @JsonProperty("category")
  private String category;

  @JsonProperty("comment")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String comment;

  @JsonProperty("extensionCategory")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String extensionCategory;

  @JsonProperty("objectId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String objectId;

  @JsonProperty("objectType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String objectType;

  @JsonProperty("reason")
  private String reason;

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
  public RestapiSubmitReportRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RestapiSubmitReportRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<RestapiSubmitReportRequest>>() {});
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

  public static class RestapiSubmitReportRequestBuilder {
    private String category;

    public RestapiSubmitReportRequestBuilder category(final String category) {
      this.category = category;
      return this;
    }

    public RestapiSubmitReportRequestBuilder categoryFromEnum(final Category category) {
      this.category = category.toString();
      return this;
    }
  }
}
