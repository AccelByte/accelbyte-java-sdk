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
public class ExportStoreToCSVRequest extends Model {

  @JsonProperty("catalogType")
  private String catalogType;

  @JsonProperty("fieldsToBeIncluded")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> fieldsToBeIncluded;

  @JsonProperty("idsToBeExported")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> idsToBeExported;

  @JsonProperty("storeId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String storeId;

  @JsonIgnore
  public String getCatalogType() {
    return this.catalogType;
  }

  @JsonIgnore
  public CatalogType getCatalogTypeAsEnum() {
    return CatalogType.valueOf(this.catalogType);
  }

  @JsonIgnore
  public void setCatalogType(final String catalogType) {
    this.catalogType = catalogType;
  }

  @JsonIgnore
  public void setCatalogTypeFromEnum(final CatalogType catalogType) {
    this.catalogType = catalogType.toString();
  }

  @JsonIgnore
  public ExportStoreToCSVRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ExportStoreToCSVRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ExportStoreToCSVRequest>>() {});
  }

  public enum CatalogType {
    APP("APP"),
    CATEGORY("CATEGORY"),
    ITEM("ITEM"),
    SECTION("SECTION"),
    VIEW("VIEW");

    private String value;

    CatalogType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ExportStoreToCSVRequestBuilder {
    private String catalogType;

    public ExportStoreToCSVRequestBuilder catalogType(final String catalogType) {
      this.catalogType = catalogType;
      return this;
    }

    public ExportStoreToCSVRequestBuilder catalogTypeFromEnum(final CatalogType catalogType) {
      this.catalogType = catalogType.toString();
      return this;
    }
  }
}
