/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelsContentDownloadResponse extends Model {

  @JsonProperty("channelId")
  private String channelId;

  @JsonProperty("createdTime")
  private String createdTime;

  @JsonProperty("creatorFollowState")
  private ModelsCreatorFollowState creatorFollowState;

  @JsonProperty("creatorName")
  private String creatorName;

  @JsonProperty("downloadCount")
  private Integer downloadCount;

  @JsonProperty("fileExtension")
  private String fileExtension;

  @JsonProperty("groups")
  private List<String> groups;

  @JsonProperty("id")
  private String id;

  @JsonProperty("isHidden")
  private Boolean isHidden;

  @JsonProperty("isOfficial")
  private Boolean isOfficial;

  @JsonProperty("likeCount")
  private Integer likeCount;

  @JsonProperty("likeState")
  private ModelsLikeState likeState;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("payload")
  private String payload;

  @JsonProperty("payloadURL")
  private List<ModelsPayloadURL> payloadURL;

  @JsonProperty("screenshots")
  private List<ModelsScreenshotResponse> screenshots;

  @JsonProperty("shareCode")
  private String shareCode;

  @JsonProperty("subType")
  private String subType;

  @JsonProperty("tags")
  private List<String> tags;

  @JsonProperty("type")
  private String type;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public ModelsContentDownloadResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsContentDownloadResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsContentDownloadResponse>>() {});
  }
}
