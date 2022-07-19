/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.models;

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
public class SlotInfo extends Model {

  @JsonProperty("checksum")
  private String checksum;

  @JsonProperty("customAttribute")
  private String customAttribute;

  @JsonProperty("dateAccessed")
  private String dateAccessed;

  @JsonProperty("dateCreated")
  private String dateCreated;

  @JsonProperty("dateModified")
  private String dateModified;

  @JsonProperty("label")
  private String label;

  @JsonProperty("mimeType")
  private String mimeType;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("originalName")
  private String originalName;

  @JsonProperty("size")
  private Integer size;

  @JsonProperty("slotId")
  private String slotId;

  @JsonProperty("storedName")
  private String storedName;

  @JsonProperty("tags")
  private List<String> tags;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public SlotInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<SlotInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<SlotInfo>>() {});
  }
}
