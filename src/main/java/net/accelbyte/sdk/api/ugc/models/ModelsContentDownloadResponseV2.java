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
public class ModelsContentDownloadResponseV2 extends Model {

  @JsonProperty("channelId")
  private String channelId;

  @JsonProperty("createdTime")
  private String createdTime;

  @JsonProperty("creatorFollowState")
  private ModelsCreatorFollowState creatorFollowState;

  @JsonProperty("customAttributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> customAttributes;

  @JsonProperty("downloadCount")
  private Integer downloadCount;

  @JsonProperty("fileExtension")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String fileExtension;

  @JsonProperty("groups")
  @JsonInclude(JsonInclude.Include.NON_NULL)
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
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsLikeState likeState;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("payloadURL")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsPayloadURL> payloadURL;

  @JsonProperty("screenshots")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsScreenshotResponse> screenshots;

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
  public ModelsContentDownloadResponseV2 createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsContentDownloadResponseV2> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsContentDownloadResponseV2>>() {});
  }
}
