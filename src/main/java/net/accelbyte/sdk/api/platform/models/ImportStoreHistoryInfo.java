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
public class ImportStoreHistoryInfo extends Model {

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("errors")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ImportStoreError> errors;

  @JsonProperty("id")
  private String id;

  @JsonProperty("importFileFormat")
  private String importFileFormat;

  @JsonProperty("initiatedBy")
  private String initiatedBy;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("note")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String note;

  @JsonProperty("storeId")
  private String storeId;

  @JsonProperty("success")
  private Boolean success;

  @JsonIgnore
  public String getImportFileFormat() {
    return this.importFileFormat;
  }

  @JsonIgnore
  public ImportFileFormat getImportFileFormatAsEnum() {
    return ImportFileFormat.valueOf(this.importFileFormat);
  }

  @JsonIgnore
  public void setImportFileFormat(final String importFileFormat) {
    this.importFileFormat = importFileFormat;
  }

  @JsonIgnore
  public void setImportFileFormatFromEnum(final ImportFileFormat importFileFormat) {
    this.importFileFormat = importFileFormat.toString();
  }

  @JsonIgnore
  public ImportStoreHistoryInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ImportStoreHistoryInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ImportStoreHistoryInfo>>() {});
  }

  public enum ImportFileFormat {
    CSV("CSV"),
    JSON("JSON");

    private String value;

    ImportFileFormat(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ImportStoreHistoryInfoBuilder {
    private String importFileFormat;

    public ImportStoreHistoryInfoBuilder importFileFormat(final String importFileFormat) {
      this.importFileFormat = importFileFormat;
      return this;
    }

    public ImportStoreHistoryInfoBuilder importFileFormatFromEnum(
        final ImportFileFormat importFileFormat) {
      this.importFileFormat = importFileFormat.toString();
      return this;
    }
  }
}
