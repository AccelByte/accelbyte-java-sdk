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
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class Slide extends Model {

  @JsonProperty("alt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String alt;

  @JsonProperty("previewUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String previewUrl;

  @JsonProperty("thumbnailUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String thumbnailUrl;

  @JsonProperty("type")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String type;

  @JsonProperty("url")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String url;

  @JsonProperty("videoSource")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String videoSource;

  @JsonIgnore
  public String getType() {
    return this.type;
  }

  @JsonIgnore
  public Type getTypeAsEnum() {
    return Type.valueOf(this.type);
  }

  @JsonIgnore
  public void setType(final String type) {
    this.type = type;
  }

  @JsonIgnore
  public void setTypeFromEnum(final Type type) {
    this.type = type.toString();
  }

  @JsonIgnore
  public String getVideoSource() {
    return this.videoSource;
  }

  @JsonIgnore
  public VideoSource getVideoSourceAsEnum() {
    return VideoSource.valueOf(this.videoSource);
  }

  @JsonIgnore
  public void setVideoSource(final String videoSource) {
    this.videoSource = videoSource;
  }

  @JsonIgnore
  public void setVideoSourceFromEnum(final VideoSource videoSource) {
    this.videoSource = videoSource.toString();
  }

  @JsonIgnore
  public Slide createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<Slide> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<Slide>>() {});
  }

  public enum Type {
    Image("image"),
    Video("video");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum VideoSource {
    Generic("generic"),
    Vimeo("vimeo"),
    Youtube("youtube");

    private String value;

    VideoSource(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class SlideBuilder {
    private String type;
    private String videoSource;

    public SlideBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public SlideBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }

    public SlideBuilder videoSource(final String videoSource) {
      this.videoSource = videoSource;
      return this;
    }

    public SlideBuilder videoSourceFromEnum(final VideoSource videoSource) {
      this.videoSource = videoSource.toString();
      return this;
    }
  }
}
