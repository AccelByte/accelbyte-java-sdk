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
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelsCreateScreenshotRequestItem extends Model {

  @JsonProperty("contentType")
  private String contentType;

  @JsonProperty("description")
  private String description;

  @JsonProperty("fileExtension")
  private String fileExtension;

  @JsonIgnore
  public String getFileExtension() {
    return this.fileExtension;
  }

  @JsonIgnore
  public FileExtension getFileExtensionAsEnum() {
    return FileExtension.valueOf(this.fileExtension);
  }

  @JsonIgnore
  public void setFileExtension(final String fileExtension) {
    this.fileExtension = fileExtension;
  }

  @JsonIgnore
  public void setFileExtensionFromEnum(final FileExtension fileExtension) {
    this.fileExtension = fileExtension.toString();
  }

  @JsonIgnore
  public ModelsCreateScreenshotRequestItem createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsCreateScreenshotRequestItem> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsCreateScreenshotRequestItem>>() {});
  }

  public enum FileExtension {
    Bmp("bmp"),
    Jfif("jfif"),
    Jpeg("jpeg"),
    Jpg("jpg"),
    Pjp("pjp"),
    Png("png");

    private String value;

    FileExtension(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelsCreateScreenshotRequestItemBuilder {
    private String fileExtension;

    public ModelsCreateScreenshotRequestItemBuilder fileExtension(final String fileExtension) {
      this.fileExtension = fileExtension;
      return this;
    }

    public ModelsCreateScreenshotRequestItemBuilder fileExtensionFromEnum(
        final FileExtension fileExtension) {
      this.fileExtension = fileExtension.toString();
      return this;
    }
  }
}
