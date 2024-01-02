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
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelsCreateContentResponseV2 extends Model {

  @JsonProperty("channelId")
  private String channelId;

  @JsonProperty("contentStatus")
  private String contentStatus;

  @JsonProperty("contentType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String contentType;

  @JsonProperty("createdTime")
  private String createdTime;

  @JsonProperty("customAttributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> customAttributes;

  @JsonProperty("fileExtension")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String fileExtension;

  @JsonProperty("fileLocation")
  private String fileLocation;

  @JsonProperty("id")
  private String id;

  @JsonProperty("isHidden")
  private Boolean isHidden;

  @JsonProperty("isOfficial")
  private Boolean isOfficial;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("parentNamespace")
  private String parentNamespace;

  @JsonProperty("payloadURL")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsPayloadURL> payloadURL;

  @JsonProperty("shareCode")
  private String shareCode;

  @JsonProperty("subType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String subType;

  @JsonProperty("tags")
  private List<String> tags;

  @JsonProperty("type")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String type;

  @JsonProperty("updatedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedTime;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public String getContentStatus() {
    return this.contentStatus;
  }

  @JsonIgnore
  public ContentStatus getContentStatusAsEnum() {
    return ContentStatus.valueOf(this.contentStatus);
  }

  @JsonIgnore
  public void setContentStatus(final String contentStatus) {
    this.contentStatus = contentStatus;
  }

  @JsonIgnore
  public void setContentStatusFromEnum(final ContentStatus contentStatus) {
    this.contentStatus = contentStatus.toString();
  }

  @JsonIgnore
  public ModelsCreateContentResponseV2 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsCreateContentResponseV2> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsCreateContentResponseV2>>() {});
  }

  public enum ContentStatus {
    PUBLISHED("PUBLISHED"),
    UNDERREVIEW("UNDER_REVIEW");

    private String value;

    ContentStatus(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelsCreateContentResponseV2Builder {
    private String contentStatus;

    public ModelsCreateContentResponseV2Builder contentStatus(final String contentStatus) {
      this.contentStatus = contentStatus;
      return this;
    }

    public ModelsCreateContentResponseV2Builder contentStatusFromEnum(
        final ContentStatus contentStatus) {
      this.contentStatus = contentStatus.toString();
      return this;
    }
  }
}
